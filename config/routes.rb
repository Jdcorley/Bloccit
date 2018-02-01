Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :posts, only: [] do 

    resources :comments, only: [:create, :destroy]
  end 

  post 'users/confirm' => 'users#confirm' 

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
