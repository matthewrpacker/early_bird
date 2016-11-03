# EarlyBird
EarlyBird is my final personal project for Module 3 at Turing School of Software and Design.  Students were required to create a successful web application from a project idea, authenticate with a third-party service, consume an api, and solve an actual problem.

### Learning Goals
- Learning how to build a full Rails app from idea to delivery.
- Revisiting previous concepts such as APIs and OAuth.
- Finding the strengths and gaps in your knowledge of Ruby, Rails, and organizing a project.

### Details
EarlyBird is a golf tee time booking system. All course information (tee times, images, addresses, etc.) displayed on the EarlyBird app is consumed from my Golf Courses API.

![App Demo](http://recordit.co/UJpdXt4mVa.gif)

### Project Links
[EarlyBird Github URL](https://github.com/matthewrpacker/early_bird)

[EarlyBird Heroku URL](https://early-bird-golf.herokuapp.com/)

[Golf Courses API Github URL](https://github.com/matthewrpacker/golf_courses_api)

[Personal Project Spec](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/self_directed_project.md)

### Setup

Ruby version
- Built on Ruby 2.3.1p112

Rails version
- Built on Rails 5.0.0.1

Database
- Built on Postgresql

Test suite dependencies
- RSpec
- Capybara
- VCR

OAuth
- Google

SMS
- Twilio

Configuration

- From the command line:

- `$ git clone git@github.com:matthewrpacker/early_bird.git`

- `$ cd early_bird/`

- `$ bundle`

- `$ rake db:{create,migrate}`

- `$ rails s`


How to run the test suite

All specs:
- `$ rspec`

Specific spec:
- `$ rspec spec/subdirectory_name/file_name`
