#!/usr/bin/env ruby -w
require 'minitest/autorun'

class TestUsersController < Minitest::Test
  def setup
    @controller = UsersController.new
    @current_user = User.new("Password!","Password!",true)
    @params = {
      user: {
        password: "Password!", 
        password_confirmation: "Password!",
        current_password: "Password!"
      }
    }
    @controller.current_user = @current_user
  end

  def test_when_update_password
    @controller.user = @current_user
    @controller.params = @params
    @controller.update_password
    assert_equal 'The operation was successful!', @controller.flash_msg
  end

  def test_when_has_no_permissions
    @controller.params = @params
    @controller.update_password
    assert_equal 'You have not permission to edit this information!', @controller.flash_msg
  end

  def test_when_invalid_password
    @params[:user].merge!(current_password: "Passwd!")
    @controller.user = @current_user
    @controller.params = @params
    @controller.update_password
    assert_equal 'Invalid password!', @controller.flash_msg
  end

  def test_when_password_must_match
    @controller.user = @current_user
    @params[:user].merge!(password_confirmation: "Passwd!")
    @controller.params = @params
    @controller.update_password
    assert_equal 'Passwords must match!', @controller.flash_msg
  end

end