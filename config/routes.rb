Rails.application.routes.draw do
  resources :posts
  namespace :users_backoffice do
    get 'welcome/index'
  end
  devise_for :users, controllers: { registrations: "users/registrations" }
  get 'welcome/index'
  get 'new_post', :to => 'posts#new'
  get 'posts', :to => 'posts#index'
  get 'users_backoffice', :to => 'users_backoffice/welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
