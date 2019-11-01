# notes.txt

## URL Shortener 🔗
### Mike Skott's solution to the [STORD URL Shortener Exercise](https://github.com/stordco/url-shortener)

### ⚠️ Assumptions

- Host machine uses [Ruby Version Manager (RVM)](https://rvm.io/) to set Ruby to 2.3.1
- Bundler **may** do the same thing by reading the version from the `Gemfile`
- It is OK to use the first 7 digits of an MD5 hash of the full URL as the short_code (This seems reasonable to me as I understand that the probability of two unequal URLs' MD5 hashes matching even just the first seven digits would be **extremely** rare.)
- It is OK to let a user add the same URL twice. (PStore prevents the duplicate entry and the hash is the same, so the user need not know it is already in use.)

### 💭 Thoughts

I started out building this in Rails, but quickly got frustrated with the bloat in 6.0, especially for such a small app. I made a pivot to Sinatra and am definitely happy with the choice. I had not integrated RSpec with Sinatra before, so I spent more time than anticipated working to get the test suite running properly. I've **never** used a `Makefile` in a Ruby project before, so I'm hoping I got everything there correct for you to spool up the app!

For the front-end, I would have liked to implement a framework like VueJS. Again I felt even the simplest framework would be overkill for the exercise, so I ended up working in plain old vanilla JavaScript. I found a really nice regex for URL validation and left a comment in the script next to it.

I usually prefer SCSS, but it seemed like adding an asset pipeline to Sinatra would be excessive, so CSS it is. At least Sinatra integrates easily with HAML, and that actually makes things even smaller and simpler so I used that. (Check out the conditional in `layout.haml` to link the javascript files.) I found a cool CSS gradient for the page background and left a comment in the stylesheet.

I very much enjoyed coding this exercise and look forward to your questions and feedback.

🥃 Enjoy,
Mike

---

# STORD URL Shortener Exercise
The goal of this exercise is to create a URL shortener web application in the same vein as [bitly](https://bitly.com/), [TinyURL](https://tinyurl.com/), or the now defunct [Google URL Shortener](https://goo.gl/). It is intentionally open-ended and you are welcome to implement your solution using the language and tech stack of your choice, but the core functionality of the application should be expressed through your own original code. This is your opportunity to show off your design and development strengths to our engineering team.

## Application Requirements

- When navigating to the root path (e.g. `http://localhost:8080/`) of the app in a browser a user should be presented with a form that allows them to paste in a (presumably long) URL (e.g. `https://www.google.com/search?q=url+shortener&oq=google+u&aqs=chrome.0.69i59j69i60l3j0j69i57.1069j0j7&sourceid=chrome&ie=UTF-8`).
- When a user submits the form they should be presented with a simplified URL of the form `http://{domain}/{slug}` (e.g. `http://localhost:8080/h40Xg2`). The format and method of generation of the slug is up to your discretion.
- When a user navigates to a shortened URL that they have been provided by the app (e.g. `http://localhost:8080/h40Xg2`) they should be redirected to the original URL that yielded that short URL (e.g `https://www.google.com/search?q=url+shortener&oq=google+u&aqs=chrome.0.69i59j69i60l3j0j69i57.1069j0j7&sourceid=chrome&ie=UTF-8`).


## Deliverable

- Fork or clone this repository
- Implement your solution, including test cases for your application code.
- We will execute your code using the `make` targets specified in `Makefile`. Edit the contents of `Makefile` to provide an interface for running and testing your application.
- Include any other notes for our engineering team that you would like regarding your approach, assumptions you have made, how to run your code, how to use your application, etc in a file named `notes.txt`.
- E-mail the point of contact that sent you this exercise and include either a link to a hosted repository (GitHub, GitLab, etc) or a compressed archive (.zip, .tar.gz) containing your solution and `Makefile`.
