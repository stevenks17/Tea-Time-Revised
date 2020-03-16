Rails.application.routes.draw do
  
  
  
  resources :brands
  resources :reviews
  resources :teas do
    resources :reviews, only: [:new, :index]
  end

  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations' }
  #devise_for :users, :controllers => { registrations: 'registrations' }

    devise_scope :user do
      get 'login', to: 'devise/sessions#new'
    end
    devise_scope :user do
      get 'signup', to: 'devise/registrations#new'
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
