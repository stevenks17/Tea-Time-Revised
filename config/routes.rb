Rails.application.routes.draw do
  
  
  
  resources :brands
  resources :reviews
  resources :teas
  get 'auth/:provider/callback' => 'sessions#create'
  
  resources :teas do
    resources :reviews, only: [:new, :index]
  end
  
  devise_for :users, :controllers => {registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
