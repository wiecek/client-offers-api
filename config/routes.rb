Rails.application.routes.draw do
  devise_for :users
  mount Api => '/api'

  resources :docs, only: [:index]
end
