class ApplicationController < ActionController::Base

  helper_method :authenticate_token!
  helper_method :current_user

  private 

    def authenticate_token! 
      if request.env["HTTP_AUTHORIZATION"]
        token = request.env["HTTP_AUTHORIZATION"].split(" ")[1]
        decoded = Auth.decode_token(token)
        @user_id = decoded[0]["user_id"] if decoded
        if !current_user || !decoded
          render json: { message: "You are not authorized" } 
        end
      else 
        render json: { message: "You must include a JWT Token!" }
      end
    end
    
    def current_user
      @current_user ||= User.find_by(id: @user_id) if @user_id
    end

end
