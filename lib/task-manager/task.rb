require 'time'

class TM::Task

  attr_reader   :status, :complete, :created_at
  attr_accessor :name, :id, :project_id, :employee_id, :priority_no, :description,

  def initialize(data)
    @name = data[:name] ||= []
    @id = data[:id]
    @project_id = data[:project_id]
    @description = data[:description]
    @priority_no = data[:priority_no]
    @employee_id = data[:employee_id]
    @created_at = Time.new
    @complete ||= []


  end

#   def complete?
#     @complete
#   end

#   def status
#     complete? ? true : false
#   end

#   def add_task(task)
#     @tasks << task
#   end

#   def mark_complete(task_id)
#     task = @tasks.select do |task|
#       task.id == task_id
#     end
#     task.status = true
#   end

#   def self.project_id_counter=(count)
#     @@project_id_counter = count
#   end

#   private
# def self.project_id_counter
#   temp = @@project_id_counter ||= 0
#   @@project_id_counter += 1
#   temp
# end
end
