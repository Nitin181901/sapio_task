Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :registrations, only: [:new,:create,:index] do 
    post 'assign_role'
  end
  resources :tasks, only: [:new,:create,:index] do
    post 'accept_task'
    post 'task_in_progress'
    post 'not_accept_task'
    post 'task_completed'
  end
  resources :roles, only: [:new,:create,:index]
  resources :categories, only: [:new,:create,:index]
  resources :subcategories, only: [:new,:create,:index]
  resources :destinations, only: [:new,:create,:index]
  resources :expenses, only: [:new,:create,:index]
  resources :subcategories, only: [:new,:create,:index]
  resources :destinations
  resources :trips
  resources :sessions, only: [:new, :create] do
    get 'report'
    post 'destroy'
  end
  resources :currencies, only: [:index] do
    get 'convert', on: :collection
    get 'historical_chart', on: :collection
  end
  root to: 'home#index'
  get 'home/task_management', to: 'home#task_management'
  get 'home/expense_tracker', to: 'home#expense_tracker'
  get 'home/currency_converter', to: 'home#currency_converter'
  get 'home/travel_itenary', to: 'home#travel_itenary'
end
