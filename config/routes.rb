Rails.application.routes.draw do
  resources :psychologists
  resources :consultations
  resources :friends
  resources :posts
  resources :consultations
  resources :psychologists
  resources :posts, only: [:update]

  namespace :users_backoffice do
    get 'welcome/index'
  end
  devise_for :users, controllers: { registrations: "users/registrations" }

  get 'schedule', to: 'consultations#show'
  get 'friend_profile', to: 'friends#friendProfile'
  get 'show_friends', to: 'friends#show'
  get 'friends_index', to: 'friends#index'
  get 'new_friend', to: 'friends#new'
  get 'welcome/index'
  get 'new_post', :to => 'posts#new'
  get 'posts', :to => 'posts#index'
  get 'users_backoffice', :to => 'users_backoffice/welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #
  resources :friends do
    post :create_friendship, on: :collection
  end


  # Defines the root path route ("/")
  root "welcome#index"
end
