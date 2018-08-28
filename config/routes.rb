Rails.application.routes.draw do
	namespace :api do 
		
		resources :games
		resources :users, only: [ :show, :index]

		post "/signup", to: "users#signup"
    	post "/login", to: "sessions#login"
    	get "/logout", to: "sessions#destroy"
    	post "/find_user", to: "sessions#find_user"
    	get "/leaders", to: "users#sorted_users"
	  
	end
end
