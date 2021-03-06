class ProfilesController < ApplicationController
    before_action :authenticate_user,  only: [:list]
    #lists all existing profiles of the current user
    def list
        render json: current_user.profiles
    end

    def create
        # Check the amount of profiles the user have
        if current_user.profiles.count(:all) == 4
            render json: {status: 406, msg: 'Profile count is at maximum of 4.'}
        else
            # Check if this user already have another profile with the same name. 
            if current_user.profiles.where(name:profile_params).empty?
                # Create a new profile for this user
                profile = current_user.profiles.create({name:profile_params})
                
                # And save it
                if profile.save
                    render json: {status: 201, msg: 'Profile was created.'}
                end
            else
                render json: {status: 409, msg: 'Provided name is already used by this user.'}
            end
        end
    end
    
    def destroy
        profile = current_user.profiles.where(name:params[:name])
        if profile.empty? || !(profile.destroy)
            render json: {status: 200, msg: 'Unable to delete specified profile.'}
        else
            render json: { status: 200, msg: 'Profile has been deleted.' }
        end
    end

    private

    def profile_params
        params.require(:name)
    end
end
