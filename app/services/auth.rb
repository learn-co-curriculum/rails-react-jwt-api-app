require 'JWT'

class Auth 

  def self.create_token(user_id)
    JWT.encode({ user_id: user_id }, ENV['JWT_SECRET'], ENV['JWT_ALGORITHM'])
  end

  def self.decode_token(token)
    JWT.decode(token, ENV['JWT_SECRET'], { algorithm: ENV['JWT_ALGORITHM'] })
      rescue JWT::DecodeError 
       nil 
  end

end