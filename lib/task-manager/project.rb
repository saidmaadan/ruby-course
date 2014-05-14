class TM::Project

attr_reader :name, :id

def initialize(data)
  @name = data[:name]
  @id = data[:id]

end
<<<<<<< HEAD
=======

def complete_task(task_id)
  @tasks.each do |task|
  if task.id == task_id
  task.status = true
  end
  end
>>>>>>> c90360d95e15a8646743c5737efd2e0b2ff0a3e4
end

