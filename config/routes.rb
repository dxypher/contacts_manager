ContactManager::Application.routes.draw do
  resources :companies


  resources :email_addresses, except: [:index, :show]


  resources :phone_numbers, except: [:index, :show]


  resources :people
end
