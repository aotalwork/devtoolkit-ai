Rails.application.routes.draw do
  root "dashboard#index"

  resources :error_debugger, only: [ :index, :create ]
  resources :test_generator, only: [ :index, :create ]
  resources :commit_coach, only: [ :index, :create ]
  resources :readme_generator, only: [ :index, :create ]
  resources :pr_reviewer, only: [ :index, :create ]
  resources :sql_optimizer, only: [ :index, :create ]
  resources :code_explainer, only: [ :index, :create ]

  resources :tools, only: [ :show ] do
    post :analyze, on: :member
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
