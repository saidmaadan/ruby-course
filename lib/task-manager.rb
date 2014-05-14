require 'ostruct'
#require 'require_all'
# Create our module. This is so other files can start using it immediately
module TM
  def self.db
    @__db_instance ||= DB.new
  end
end

# Require all of our project files
require_relative 'task-manager/task.rb'
require_relative 'task-manager/project.rb'
require_relative 'task-manager/project_manager.rb'
require_relative 'task-manager/employee.rb'
require_relative 'task-manager/db.rb'
require 'pry-debugger'
#require 'colorize'

#require_rel 'task-manager/*.rb'
