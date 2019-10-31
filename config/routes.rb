Rails.application.routes.draw do
  resources :parkings
  root 'welcome#index'
  get '/schedules/:id', to: 'welcome#schedules', as: 'schedule'
  resources :prices
  resources :records
  resources :railcars
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
