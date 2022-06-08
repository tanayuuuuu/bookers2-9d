Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about", as: :about

  resources :books do
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end