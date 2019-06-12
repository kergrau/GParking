Rails.application.routes.draw do
  root 'welcome#index'
  resources :prices
  resources :records
  resources :railcars
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
