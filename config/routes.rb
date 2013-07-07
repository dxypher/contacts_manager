ContactManager::Application.routes.draw do
  root to: 'companies#index'
  resources :companies
  resources :email_addresses, except: [:index, :show]
  resources :phone_numbers, except: [:index, :show]
  resources :people
  get '/auth/:provider/callback' => 'sessions#create'
end
