module TM
  class AssignTaskToEmployee < UseCase
    def run(inputs)
      task = DB.get_task(inputs[:task_id])
      return failure(:task_does_not_exist) if task.nil?

      emp = DB.get_employee(inputs[:employee_id])
      return failure(:employee_does_not_exist) if emp.nil?

      # NOT SHOWN: Modify task to assign to employee

      # Return a success with relevant data
      success :task => task, :employee => emp
    end
  end
end
