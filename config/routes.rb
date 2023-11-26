Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :employees
  resources :documents

  #public pages routes
  get 'about' => 'pages#about_us'
  get 'contact' => 'pages#contact_us'
  get 'privacy-policy' => 'pages#privacy_policy'
  get 'terms-and-conditions' => 'pages#terms_and_conditions'
 
  # # get 'home/index'
  # get '/home' => 'home#index'
end
