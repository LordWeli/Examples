Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :item_of_tables, only: %i[index]
  resources :paginations, only: %i[index]
  resources :people, only: %i[new create update]
  
  root to: "examples#index"
end
