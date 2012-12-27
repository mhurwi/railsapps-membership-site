MembershipSite::Application.routes.draw do

	mount StripeEvent::Engine => '/stripe'

  get "content/silver"

  get "content/gold"

  get "content/platinum"


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources :users


  resources :incidents do
    resources :feelings
    resources :thoughts do
      resources :distortions
    end
  end



end