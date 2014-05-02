require './setup'

class UsersController

  def update_password
    #user = User.find(params[:id])
    password_changed = false
    #the user found  on the database is the the same user that is logged in
    if user == current_user
      # The fields match
      if params[:user][:password] == params[:user][:password_confirmation]
          #The user has already a password
          if user.updated_password  
            #The user has already a password and is valid
            if user.valid_password?(params[:user][:current_password])
              user.update_with_password(params[:user])
              password_changed = true

            else
              @flash_msg = 'Invalid password!'
            end
          else
            #The user doesn't knows his/her password 
            user_attr = params[:user].merge(:updated_password => true)
            user.update_attributes(user_attr)
            password_changed = true

          end

        if password_changed == true
          #sign_in(user, :bypass => true)
          @flash_msg = 'The operation was successful!'
        end
      else
        @flash_msg = 'Passwords must match!'
        
      end
    else
      @flash_msg = 'You have not permission to edit this information!'
    end
  end

end

require './tests' if __FILE__ == $0