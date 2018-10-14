class UserTokenController < Knock::AuthTokenController
    skip_before_action :verify_authenticity_token #Fixing issue with 5.2
end
