Rails.application.routes.draw do
  devise_for :users

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]  
  end

  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'

  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
