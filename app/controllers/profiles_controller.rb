class ProfilesController < ApplicationController
    before_action :authenticate_user,  only: [:list]
    #lists all existing profiles of the current user
    def list
        current_user.update!(last_login: Time.now)
        render json: current_user.profiles
    end

    def create
        # Check the amount of profiles the user have
        if current_user.profiles.count(:all) == 4
            render json: {status: 406, msg: 'Profile count is at maximum of 4.'}
        else
            # Create a new profile for this user
            profile = current_user.profiles.create({name:profile_params})
            
            # And save it
            if profile.save
                render json: {status: 201, msg: 'Profile was created.'}
            end
        end
    end
    private
    def profile_params
        params.require(:name)
    end
end
