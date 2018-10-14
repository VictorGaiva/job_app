Rails.application.routes.draw do
	# Home controller routes.
	root   'home#index'
	get    'auth'           	=> 'home#auth'

	# Get login token from Knock
	post   'user_token'      	=> 'user_token#create'

	# User actions
	get    '/users'          	=> 'users#index'   #works
	get    '/users/current'  	=> 'users#current' #works
	post   '/users/create'   	=> 'users#create'  #works
	patch  '/user/:id'       	=> 'users#update'  #works
	delete '/user/:id'       	=> 'users#destroy' #works
	get	   '/user'				=> 'profiles#list' #works

	# Profiles
	get    '/profiles'         	=> 'profiles#list'   #works
	post   '/profiles/create'  	=> 'profiles#create' #works
	patch  '/profiles/:id'     	=> 'profiles#update' #
	delete '/profiles/:id'     	=> 'profiles#destroy'#works
	get	   '/profile'			=> 'movies#list' 	 #works

	# Movies
	get    '/movies'         	=> 'movies#list'   	 #
	get    '/movies'         	=> 'movies#list'   	 #
	post   '/movies/create'  	=> 'movies#create'   #
	patch  '/movies/:id'     	=> 'movies#update'   #
	delete '/movies/:id'     	=> 'movies#destroy'  #
	get    '/movie'  	    	=> 'movies#view'     #

end