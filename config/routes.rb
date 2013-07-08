ContactManager::Application.routes.draw do
  root to: 'site#index'
  resources :companies
  resources :email_addresses, except: [:index, :show]
  resources :phone_numbers, except: [:index, :show]
  resources :people
  get '/auth/:provider/callback' => 'sessions#create'
  match '/login' => redirect("/auth/twitter"), as: :login
  delete "/logout" => "sessions#destroy", as: :logout
end
