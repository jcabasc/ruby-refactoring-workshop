require './setup'

class User

  def authentication
    authentications.last
  end

  def followers_count
    authentication.followers.count
  end
end

class SessionController
  def show
    @welcome_message = message
  end

  def index
    @users = []
    User.all.map do |user|
      @users << {
        email: email_of(user),
        username: username_of(user),
        followers: followers_from(user)
      }
    end
    @users
  end

  private

  def current_user
    if params[:session_id]
      @current_user ||= User.find(params[:session_id])
    end
  end

  def message
    if current_user
      if current_user.authentication
        "Hi #{current_user.fullname}, you're logged in with #{current_user.authentication.provider}"
      else
        "Hi #{current_user.fullname}, you're logged in with DemoProvider"
      end
    else
      "Hi Demo, you're logged in with DemoProvider"
    end
  end

  def followers_from(user)
    if user.authentication && user.authentication.followers.any?
      "You have #{user.followers_count} followers"
    else
      "You have 0 followers"
    end
  end

  def email_of(user)
    if user.authentication && user.authentication.email
      user.authentication.email
    else
      "demo@test.com"
    end
  end

  def username_of(user)
    if user.authentication && user.authentication.username
      user.authentication.username
    else
      "demo"
    end
  end

end

require './tests' if __FILE__ == $0
