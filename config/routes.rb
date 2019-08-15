Rails.application.routes.draw do
  root 'static#home' 
  
  resources :users, only: [ :new, :create, :show] do 
  
      resources :recipes
  end 
  resources :recipes, only: [:new, :create, :index]

  resources :comments, only: %i[create destroy]

  get "/auth/:provider/callback" => "sessions#login_with_auth"
  get '/signin', to: "sessions#signin"
	post '/signin', to: "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
