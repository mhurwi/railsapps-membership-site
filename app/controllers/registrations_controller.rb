class RegistrationsController < Devise::RegistrationsController


=begin 

http://railsapps.github.com/tutorial-rails-stripe-membership-saas.html

We override the controller new action to set the plan variable. 
This allows us to display the name of the selected subscription plan 
on the registration page. When we modify the registration form, we’ll 
include the plan variable in a hidden input field. The plan parameter is 
passed from the home page when the visitor clicks one of the “Subscribe” 
buttons. We call the super method to inherit the original controller new action.

Devise provides a Registrations controller inside the Devise gem. 
It contains standard RESTful controller actions, including new and 
create (see Devise::RegistrationsController on GitHub). Before calling new 
or create, the Devise Registrations controller initializes a new User with 
a private method named build_resource. The default build_resource method 
won’t assign an authorization role to our user. We override the build_resource 
method, first using the super method to call the parent build_resource method. 
Then we check if the plan parameter is available. On a new action, it will be 
available as a parameter passed from the home page. On a create action, it 
will be passed as a parameter from a hidden input field on the registration 
form. Rolify has added the add_role method to the User model, so we call 
add_role to assign the plan as an authorization role. If you’re wondering 
why you don’t see the User model as a @user variable, Devise has aliased it 
as the resource instance variable (resource allows Devise to accommodate models 
ith names other than User, such as Account or Person).

=end


  def new
    @plan = params[:plan]
    super
  end

  private
  def build_resource(*args)
    super
    if params[:plan]
      resource.add_role(params[:plan])
    end
  end
end