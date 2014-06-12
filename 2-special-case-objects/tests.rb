#!/usr/bin/env ruby -w
require 'minitest/autorun'

class TestSessionsController < Minitest::Test
  def setup
    @controller = SessionController.new
  end

  def test_session_show_when_current_user_authenticated_with_provider
    followers = [ :new_follower ]
    authentications = [ Authentication.new("facebook", "jonsnow@got.com", "watchman", followers) ]
    @params = { session_id: 1 }
    @controller.params = @params
    @controller.show
    assert_equal "Hi Jon snow, you're logged in with facebook", @controller.welcome_message
  end

  def test_session_show_when_current_user_is_not_authenticated
    @params = { session_id: 2 }
    @controller.params = @params
    @controller.show
    assert_equal "Hi Tyrion lannister, you're logged in with DemoProvider", @controller.welcome_message
  end

    def test_session_show_when_no_current_user
    @params = { session_id: 4 }
    @controller.params = @params
    @controller.show
    assert_equal "Hi Demo, you're logged in with DemoProvider", @controller.welcome_message
  end

  def test_session_index
    @controller.index
    user_collection = [
      {:email=>"jon.snow@got.com",
       :username=> "watchman",
       :followers=>"You have 1 followers"},
      {:email=>"demo@test.com",
       :username=> "demo",
       :followers=>"You have 0 followers"}
     ]
    assert_equal user_collection, @controller.users
  end
end
