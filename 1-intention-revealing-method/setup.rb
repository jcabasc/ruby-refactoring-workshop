class User < Struct.new(:email, :role)
  def projects
    [:private_project]
  end
  def has_role?(role)
    self.role == role.to_s
  end
end

class Project
  def self.all
    [:public_project, :private_project]
  end
end

class ProjectsController
  attr_accessor :current_user, :flash_msg, :projects
end
