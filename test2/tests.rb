#!/usr/bin/env ruby -w
require 'minitest/autorun'

class TestSessionsController < Minitest::Test
  def setup
    @controller = SessionController.new
    @params = {
      session_id: 1
    }
    @controller.params = @params
  end

  def test_session_show_when_current_user
    @current_user = User.find(@params[:session_id])
    @controller.current_user = @current_user
    @controller.show
    assert_equal "Hi Jon snow, you're logged in with facebook", @controller.welcome_message
  end

  def test_session_show_when_no_current_user
    @current_user = User.find(@params[:session_id], "instantiate_without_authentication")
    @controller.current_user = @current_user
    @controller.show
    assert_equal "Hi Demo, you're logged in with DemoProvider", @controller.welcome_message
  end

  def test_session_index
    @controller.index
    user_collection = [
      {:email=>"jon.snow@got.com",
       :followers=>"You have 1 followers"},
      {:email=>"demo@test.com", 
       :followers=>"You have 0 followers"}
     ]
    assert_equal user_collection, @controller.users
  end

end