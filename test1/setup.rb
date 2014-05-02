class User < Struct.new(:password, :password_confirmation, :updated_password)
  
  def valid_password?(password)
  	password.length > 8
  end

  def update_with_password(password)
  	true
  end

end

class UsersController
  attr_accessor :current_user, :flash_msg, :user, :params
end
