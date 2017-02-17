class RegistrationsController < ApplicationController

  def signup 
    user = User.new(user_params)
    if user.save 
      render json: { 
        profile: {
          full_name: user.full_name, 
          email: user.email,
          username: user.username
        }, 
        token: Auth.create_token(user.id) 
      }
    else 
      render json: user.errors.full_messages 
    end
  end

  private 

    def user_params 
      params.require(:user).permit(:first_name, :last_name, :password, :email, :username)
    end
end
