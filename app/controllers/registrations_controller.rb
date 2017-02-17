class RegistrationsController < ApplicationController

  def signup 
    user = User.new(user_params)
    if user.save 
      render json: user 
    else 
      render json: user.errors.full_messages 
    end
  end

  private 

    def user_params 
      params.require(:user).permit(:first_name, :last_name, :password, :email, :username)
    end
end
