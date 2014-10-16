class User < Struct.new(:id, :email, :role)
  def projects
    [:private_project, :public_project]
  end

  def public_projects
    [:public_project]
  end

   def self.find(id)
        self.all.map{|user| return user if user.id == id }
        nil
   end

    def self.all
      [new(1, 'jesse@savewalterwhite.com','student')]
    end
end

class ProjectsController
  attr_accessor :current_user, :flash_msg, :projects, :params, :user
end
