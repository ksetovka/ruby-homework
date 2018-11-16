Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :authors
  root 'landing#index'

  get 'polynomials/new', to: 'polynomials#new'   # <-- WE ADDED
  get 'polynomials/:id', to: 'polynomials#show'  # <-- THESE
  post 'polynomials', to: 'polynomials#create'   # <-- LINES
end
