Rails.application.routes.draw do
  resources :books
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'site#home'
  get '/about' => 'site#about', as: 'about'
  get '/how-works' => 'site#how_works', as: 'how_works'
  get '/contatc' => 'site#contact', as: 'contact'
  get 'search', to: 'search#search'

end
