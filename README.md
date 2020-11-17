# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Completed as a project during the Lighthouse Labs Web Development 12 week bootcamp. We were provided with a base of code and no prior exposure to Ruby/Rails and asked to fix bugs and add features to the app.

Features added include user login/registration, admin category listings, admin category creation, admin dashboard, admin panel basic authentication, conditional sold out icons and consistent currency display. We also implemented unit and feature testing with a combination of Capybara, Poltergeist, RSpec, and Phantomjs.

# Screenshots
![cart](https://github.com/saadxislam/jungle-rails/blob/master/docs/cart_page.png)
![home](https://github.com/saadxislam/jungle-rails/blob/master/docs/home_page.png)
![thanks](https://github.com/saadxislam/jungle-rails/blob/master/docs/thanks_page.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
