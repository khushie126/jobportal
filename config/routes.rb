Rails.application.routes.draw do
  # config/routes.rb

  resources :profile_informations

  resources :companies do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:index]
  
  resources :job_posts do
    member do
      get :apply
    end
  end
  resources :applied_jobs

  root "pages#home"

  # resources :reviews
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
end
