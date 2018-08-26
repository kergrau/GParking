Rails.application.routes.draw do
  resources :prices
  resources :records do
    collection do
      get 'prueba'
    end
  end
  resources :railcars
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
