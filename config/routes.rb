Rails.application.routes.draw do
  get 'users/edit'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  # topページroute
  root 'books#top'
  get '/about' => 'books#about'


  resources :users
end