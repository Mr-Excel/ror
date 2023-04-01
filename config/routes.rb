Rails.application.routes.draw do
  get 'relationships/index'

  resources :dependents
  resources :relationships
  
  devise_for :users, controllers: { :sessions => "users/sessions", :passwords => 'users/passwords', :registrations => 'users/registrations' }

  get "users/" => "users/generic#new", as: "all_users"
  get "/dashboard/:id" => "dashboards#index", as: "v_edit_users"
  get "/dashboard" => "dashboards#new", as: "v_new_users"
  post "/dashboard" => "dashboards#create", as: "new_users"
  patch "/dashboard" => "dashboards#update", as: "c_edit_users"
  
  # get 'users/', to: 'users/registrations#index', as: 'index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboards#new"
end
