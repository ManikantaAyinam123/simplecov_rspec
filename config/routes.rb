Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  resources :users
  resources :articles
  get 'articles/custom_method', to: 'articles#custom_method', as: :custom_method_articles
  # Defines the root path route ("/")
  # root "posts#index"
end
