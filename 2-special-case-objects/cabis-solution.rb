require File.expand_path('../setup.rb', __FILE__)

class NilAuthentication
  def provider; "DemoProvider"; end
  def email; "demo@test.com"; end
  def username; "demo"; end
  def followers
    []
  end
end

class NilUser
  def fullname; "Demo"; end
  def authentication; NilAuthentication.new; end
end

class User
  def authentication
    authentications.last || NilAuthentication.new
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
      @current_user ||= User.find(params[:session_id]) || NilUser.new
    end
  end

  def message
    "Hi #{current_user.fullname}, you're logged in with #{current_user.authentication.provider}"
  end

  def followers_from(user)
    "You have #{user.followers_count} followers"
  end

  def email_of(user)
    user.authentication.email
  end

  def username_of(user)
    user.authentication.username
  end

end

require File.expand_path('../tests.rb', __FILE__) if __FILE__ == $0