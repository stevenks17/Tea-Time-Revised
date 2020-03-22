Rails.application.routes.draw do

  root :to => 'teas#welcome'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations' }

    #devise_scope :user do
      #authenticated :user do 
       #root :to => 'devise/sessions#welcome'
      #end
      #unauthenticated :user do
        #root :to => 'devise/registrations#new', as: unauthenticated_root
      #end
    #end

    devise_scope :user do
      get 'login', to: 'devise/sessions#new'
      get 'signup', to: 'devise/registrations#new'
    end
  
  
  resources :reviews 
  resources :teas do
    resources :reviews, only: [:new, :index]
  end
  resources :review
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
