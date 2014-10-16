require File.expand_path('../setup.rb', __FILE__)

class ProjectsController
  def index
    if current_user
      user = User.find(params[:id])
      if user == current_user
        @projects = current_user.projects
      #when the user is logged in as an admin display all projects
      elsif current_user.role == "admin"
          @projects = user.projects
        else
          #when the user is logged in as a regular user
          @projects = user.public_projects
      end
    else
      #when the user is not logged in
      @flash_msg = 'You have to login in order to see the projects!'
    end
  end

end

require File.expand_path('../tests.rb', __FILE__) if __FILE__ == $0
