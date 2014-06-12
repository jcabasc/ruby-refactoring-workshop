require File.expand_path('../setup.rb', __FILE__)

class ProjectsController
  def index
    return display_message unless current_user
    @projects = if current_user_is_admin_or_found_user
                          user.projects
                        else
                          user.public_projects
                        end
  end

  private

  def current_user_is_admin_or_found_user
    current_user == user || current_user_is_admin?
  end

  def user
    @user ||= User.find(params[:id])
  end

  def current_user_is_admin?
    current_user.role == "admin"
  end

  def display_message
     @flash_msg = 'You have to login in order to see the projects!'
  end

end

require File.expand_path('../tests.rb', __FILE__) if __FILE__ == $0