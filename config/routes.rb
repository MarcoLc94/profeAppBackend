Rails.application.routes.draw do
  resources :logins
  
  resources :users do
    resources :groups
    resources :notifications
  end

  resources :groups do
    resources :students
    resources :tasks
    resources :subjects
    resources :attendances
    resources :grades, only: [:index]
    resources :reports, only: [:index]
    resources :behavior_entries, only: [:index]
  end

  resources :students do
    resources :grades
    resources :behavior_entries
    resources :reports
  end

  resources :attendances do
    resources :attendance_records
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
