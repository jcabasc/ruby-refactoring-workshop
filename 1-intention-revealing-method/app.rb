require File.expand_path('../setup.rb', __FILE__)

class ProjectsController
  def index
    #when the user is logged in as an admin
    if current_user && current_user.has_role?(:admin)
      @projects = Project.all
    else
      #when the user is logged in as a normal user
      if current_user && current_user.has_role?(:user)
        @projects = current_user.projects
      else
        #when the user is not logged in
        @flash_msg = 'You have to login in order to see the projects!'
      end
    end
  end
end

require File.expand_path('../tests.rb', __FILE__) if __FILE__ == $0
