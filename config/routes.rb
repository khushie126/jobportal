Rails.application.routes.draw do
  resources :profile_informations
  resources :companies
  resources :job_posts do
    post 'apply', to: 'job_posts#create', as: 'apply'
  end
  resources :applied_jobs
  
  root "pages#home"


  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  
end
