require 'time'

class TM::Task

  attr_reader   :status, :created_at, :completed_at, :completed, :overdue
  attr_accessor :name, :id, :project_id, :employee_id, :priority_no, :description



  def initialize(data)
    @name = data
    @id = id
    @description = description
    @name = data[:name]
    @id = data[:id]
    @description = data[:description]
    @priority_no = data[:priority_no]
    @project_id = data[:project_id]
    @employee_id = data[:employee_id]
    @completed_at = Time.now
    @created_at = data[:create_time]
    @completed = data[:complete]
  end

  def mark_task_complete(task_id)
      task = get_task(task_id)
      task.completed = true
      # update the database

      task
    end
end



  # def mark_completed
  #   @completed = true
  #   @completed_at = Time.now
  # end

  # def mark_incomplete
  #   @completed = false
  #   @completed_at = nil
  # end

  # def overdue?
  #   Time.now > @date_due
  # end


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
