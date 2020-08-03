Rails.application.routes.draw do
  mount ClientApi => '/api'

  resources :docs, only: [:index]
end
