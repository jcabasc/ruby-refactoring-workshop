#!/usr/bin/env ruby -w
require 'minitest/autorun'

class TestProjectsController < Minitest::Test
  def setup
    @controller = ProjectsController.new
  end

  def test_index_when_current_user_is_the_found_user
    @controller.params = {id: 1 }
    @current_user = User.new(1,"jesse@savewalterwhite.com", "student")
    @controller.current_user = @current_user
    @controller.index
    assert_equal @current_user.projects, @controller.projects
  end

  def test_index_when_current_user_is_not_the_found_user_and_is_admin
    @controller.params = {id: 1 }
    @current_user = User.new(2,"walter@savewalterwhite.com", "admin")
    @controller.current_user = @current_user
    @controller.index
    assert_equal @controller.projects, [:private_project, :public_project]
  end

  def test_index_when_current_user_is_not_the_found_user_and_is_not_admin
    @controller.params = {id: 1 }
    @current_user = User.new(2,"walter@savewalterwhite.com", "user")
    @controller.current_user = @current_user
    @controller.index
    assert_equal @controller.projects, [:public_project]
  end

  def test_index_when_no_current_user
    @controller.current_user = nil
    @controller.index
    assert_equal "You have to login in order to see the projects!", @controller.flash_msg
    assert_equal @controller.projects, nil
  end
end
