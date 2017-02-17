class AuthController < ApplicationController

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: { 
        profile: {
          full_name: user.full_name, 
          email: user.email,
          username: user.username
        }, 
        token: Auth.create_token(user.id) 
      } 
    else 
      render json: { err: 'incorrect username or passsword' }
    end
  end

end
