class ContentController < ApplicationController
	
	# This is Devise's 'authenticate user' to make users be logged in
	before_filter :authenticate_user!


	# these are CanCan's 'authorize!' to make sure user has the proper role to see the pages
  def silver
  	authorize! :view, :silver, :message => 'Access limited to Silver Plan subscribers.'
  end

  def gold
  	authorize! :view, :gold, :message => 'Access limited to Gold Plan subscribers.'
  end

  def platinum
  	authorize! :view, :platinum, :message => 'Access limited to Platinum Plan subscribers.'
  end
end
