Rails.application.routes.draw do
  root 'static#home' 
  
  resources :users, only: [:new, :create, :show] do 
  
      resources :recipes
  end 
  

  get '/signin', to: "sessions#signin"
	post '/signin', to: "sessions#create"
	delete '/sessions', to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
