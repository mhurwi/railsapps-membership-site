Membership Site
========================

This application was generated with the rails_apps_composer gem:
https://github.com/RailsApps/rails_apps_composer
provided by the RailsApps Project:
http://railsapps.github.com/



http://railsapps.github.com/tutorial-rails-stripe-membership-saas.html




todo:

## x Set Up the Database

- x Create a Default User
- x Seed the Database
- x Test the starter app
- x replace the home page
- x css for subscription plans
- x Add content pages
- x Check content views

## x implement authorization

- x set cancan ability
- x set access limits in content controller
- x test authorization

## x Registration page

- x modify home page
- x modify nav links
- x override devise registrations controller
- x override devise routes
- x override devise registration page
- x test registration

## Redirect after sign up or login

- x modify application controller
- x test redirect

## Stripe integration

- x stripe initializer
- x add virtual attribute to user model
- x add credit card data to registration form
- x add js from stripe server
- x script to conditional execution of page-specific javascript
- x script for dynamic loading of remote js files
- x create registrations js file
- x add javascript for form processing
- x prepare stripe account
- x migration for user model
- modify user model
- test stripe integration


## Account changes

## Stripe webhooks

## Deploy to heroku




## Additions to the tutorial
### Jekyl Blog
Using [bloggy](https://github.com/zbruhnke/bloggy)

- to generate new post:  rake np post-title 
- to generate the static site: rake generate
- config/jekyll contains layouts and posts
- public/blog contains the compiled static site
