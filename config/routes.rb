Rails.application.routes.draw do
  root 'welcome#index'
  get '/schedules/:id', to: 'welcome#schedules', as: 'schedule'
  get '/parkings/new', to: 'parkings#new', as: 'new_parking'
  get '/parkings', to: 'parkings#index', as: 'parkings'
  post '/parkings', to: 'parkings#create'
  resources :prices
  resources :records
  resources :railcars
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
