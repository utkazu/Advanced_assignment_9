Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'

  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  post 'favorites/:book_id/create' => 'favorites#create'
  post 'favorites/:book_id/destroy' => 'favorites#destroy'
  post 'book_comments/:book_id/create' => 'book_comments#create'
  post 'book_comments/:book_comment_id/destroy' => 'book_comments#destroy'
  post 'search' => 'search#search'
end
