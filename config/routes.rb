Rails.application.routes.draw do
  devise_for :users
  resources :books

  root to: 'site#home'
  get 'search', to: 'search#search'
end
