require 'http'

class MoviesController < ApplicationController

    def search
        my_params = movies_params
        # If a query was provided
        if my_params.query?
            # Make a search using it
            response = HTTP.get("https://api.themoviedb.org/3/", :params => {:api_key=>"e3ffce39e123fc9f9f44148fd8dd66da", :query => my_params[:query]}) 
        else
            # Else, show the user some suggestions
            response = HTTP.get("https://api.themoviedb.org/3/", :params => {:api_key=>"e3ffce39e123fc9f9f44148fd8dd66da", :query => 'Harry Potter'})
        end
        render json: response
    end

    def view
        my_params = movies_params
        # If the specified profile is present
        user_profiles = current_user.profiles.where(name:my_params[:name])
        if user_profiles.empty?
            # This following line assumes that there is no more than one profile with a specific name for each user
            current_profile = user_profiles.first()
            render json:current_profile.movies
        else # Else
            render json: { status: 404, msg: 'Unable to find profile' }
        end
    end

    

    private
    def movies_params
        params.permit(:name, :query).require(:name)
    end
end
