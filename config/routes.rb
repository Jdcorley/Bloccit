Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
  end
  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  post 'users/confirm' => 'users#confirm'

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
