# spec/url_shortener_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe "The URL Shortener Application" do
  it "lets me access the index page" do
    # Given:
    # nothing
    # When:
    get '/'
    # Then:
    expect(last_response).to be_ok
    expect(last_response.body).to include('Please enter a URL to shorten')
  end

  it "redirects to the proper URL" do
    # Given:
    params = { short_code: "99999eb" }
    # When:
    get "/#{params[:short_code]}", params
    # Then:
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_request.url).to eql('https://google.com/')
  end

  it "does not redirect for unknown short_codes" do
    # Given:
    params = { short_code: "XxXxXxX" }
    # When:
    get "/#{params[:short_code]}", params
    # Then:
    expect(last_response.status).to eql(404)
    expect(last_response.body).to include('not found')
  end

  it "returns the expected short_code for a URL" do
    # Given:
    params = { url: "https://google.com/" }
    # When:
    post "/", params
    # Then:
    expect(last_response.body).to include('/f82438a')
  end

end
