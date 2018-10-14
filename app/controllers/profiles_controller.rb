class ProfilesController < ApplicationController
    before_action :authenticate_user,  only: [:list]
    #lists all existing profiles of the current user
    def list
        current_user.update!(last_login: Time.now)
        render json: current_user
    end

    def create
        # 
        profile = current_user.profiles.create({name:profile_params})
        if profile.save
            render json: {status: 200, msg: 'Profile was created.'}
        end
    end
    private
    def profile_params
        params.require(:name)
    end
end
