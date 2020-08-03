Rails.application.routes.draw do
  mount Api => '/api'

  resources :docs, only: [:index]
end
