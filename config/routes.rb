Rails.application.routes.draw do
	# Home controller routes.
	root   'home#index'
	get    'auth'           	=> 'home#auth'

	# Get login token from Knock
	post   'user_token'      	=> 'user_token#create'#(works) Get a token for a user with given credentials

	# User actions
	get    '/users'          	=> 'users#index'   #(works) Get the information for the current user
	get    '/users/current'  	=> 'users#current' #(works) Get the information for the current user
	post   '/users/create'   	=> 'users#create'  #(works) Create a new user
	patch  '/user/:id'       	=> 'users#update'  #(works) Update user's information
	delete '/user/:id'       	=> 'users#destroy' #(works) Delete a user
	get	   '/user'				=> 'profiles#list' #(works) List user's profiles, if he is logged in

	# Profiles
	get    '/profiles'         	=> 'profiles#list'   #(works) List existing user's profiles
	post   '/profiles/create'  	=> 'profiles#create' #(works) Create a new profile for logged in user
	patch  '/profiles/:id'     	=> 'profiles#update' #() Update user's information
	delete '/profiles/:id'     	=> 'profiles#destroy'#(works) Delete the profile specified by the 'id' field

	# Movies list actions
	get    '/profile/:name'    	=> 'movies#view'   	 #() List the saved movies for the profile
	post   '/profile/:name'  	=> 'movies#create'   #() Adds a new movie based on the ID. If ID isn't found on remote, returns an error
	patch  '/profile/:name'    	=> 'movies#update'   #() Update a movie's status (Watch Later | Watched)
	delete '/profile/:name'    	=> 'movies#destroy'  #() Remove a movie from this list
	
	# Movies
	get    '/profile/:name/search' => 'movies#search'#() Text based search. If no query parameter is provided, it shows the user some suggestions

end