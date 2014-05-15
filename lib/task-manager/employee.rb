class TM::Employee

  attr_reader :name, :id
  attr_accessor :project_id, :task_id

   def initialize(data)
    @name = data[:name]
    @id = data[:id]
    @project_id = data[:project_id]
    @task_id = data[:task_id]

  end
end
