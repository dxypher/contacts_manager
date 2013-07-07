ContactManager::Application.routes.draw do
  resources :companies


  resources :email_addresses


  resources :phone_numbers, except: [:index, :show]


  resources :people
end
