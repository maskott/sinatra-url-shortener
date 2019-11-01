# url_shortener.rb
require 'sinatra'
require 'digest'
require 'pstore'
require 'haml'

get '/:short_code' do
  url = Link.read(params[:short_code])
  if url
    redirect url, 301
  else
    status 404
    haml :not_found
  end
end

get '/' do
  @script = "validate_form"
  haml :index
end

post '/' do
  @script    = "copy_link"
  @short_url = generate_short_url(params[:url])
  haml :created
end

def generate_short_url(url)
  short_code = Digest::MD5.hexdigest(url)[0..6]
  Link.save(short_code, url)

  "#{request.env["rack.url_scheme"]}://#{request.env["SERVER_NAME"]}:#{request.env["SERVER_PORT"]}/#{short_code}"
end

class Link
  def self.save(short_code, url)
    store.transaction do |t|
      store[short_code] = url
    end
  end

  def self.read(short_code)
    store.transaction { store[short_code] }
  end

  def self.store
    @store ||= PStore.new("Links.db")
  end
end
