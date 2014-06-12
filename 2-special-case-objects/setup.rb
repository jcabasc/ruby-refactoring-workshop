class User
  attr_reader :fullname, :email, :authentications, :followers

  def initialize(fullname, email, authentications, followers)
    @fullname = fullname
    @email = email
    @authentications = authentications
    @followers = followers
  end

  def self.find(id, scope="instantiate_with_everything")
    self.send(scope)
  end

  def self.all
    user_with_everything = User.find(1, "instantiate_with_everything")
    user_without_followers_and_email = User.find(1, "instantiate_without_anything")
    [user_with_everything, user_without_followers_and_email]
  end

  private

  def self.instantiate_with_everything
    authenications = [ Authentication.new("facebook") ]
    followers = [ :new_follower ]
    User.new("Jon snow","jon.snow@got.com", authenications, followers)
  end

  def self.instantiate_without_authentication
    followers = [ :new_follower ]
    User.new("Tyrion lannister","tyrion.lannister@got.com", [], followers)
  end

  def self.instantiate_without_anything
    User.new("Jon snow","", [], [])
  end
end

class Authentication < Struct.new(:provider)
end

class SessionController
  attr_accessor :params, :welcome_message, :current_user, :users
  attr_reader :show, :index
end

