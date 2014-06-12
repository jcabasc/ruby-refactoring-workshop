class User
  attr_reader :id, :fullname, :authentications

  def initialize(id, fullname, authentications)
    @id = id
    @fullname = fullname
    @authentications = authentications
  end

  def self.find(id)
    self.all.map{|user| return user if user.id == id }
    nil
  end

  def self.all
    followers = [ :new_follower ]
    authentications = [ Authentication.new("facebook", "jon.snow@got.com", "watchman", followers) ]
    user_with_everything = User.new(1, "Jon snow", authentications)
    user_without_anything = User.new(2, "Tyrion lannister", [])
    [user_with_everything, user_without_anything]
  end
end

class Authentication < Struct.new(:provider, :email, :username, :followers)
end

class SessionController
  attr_accessor :params, :welcome_message, :current_user, :users
  attr_reader :show, :index
end

User.all
