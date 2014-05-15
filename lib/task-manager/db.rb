module TM

  class DB
    attr_accessor :projects, :tasks, :employees, :membership, :project_count, :task_count, :employee_count

    def initialize
      @projects = {}
      @tasks = {}
      @employees = {}
      @membership = []
      @project_count = 0
      @task_count =0
      @employee_count = 0
    end

    def create_project(data)
      data[:id] ||= @project_count +1
      return nil if @projects[data[:id]]
      @project_count +=1
      @projects[data[:id]] = data
      build_project(data)
      end


    def get_project(id)
      data = @projects[id]
      if !data.nil?
        build_project(data)
      end
    end

    def update_project(id, data)
      @projects[id].merge!(data)
      build_project(@projects[id])
    end

    def destroy_project(id)
      @projects.delete(id)
    end

    def list_projects
      list = []
      @projects.each do |id, data|
        list << build_project(data)
      end
      list
    end

    def create_task(data)
      @task_count += 1
      data[:id] = @tasks_count
      data[:create_time] = Time.now
      data[:complete] = false
      @tasks[data[:id]] = data
      build_task(data)
    end

    def get_task(id)
      build_task(@tasks[id]) if @tasks[id]
    end

    def update_task(id, data)
      return nil unless @tasks[id]
      @tasks[id].merge!(data)
      build_task(@tasks[id])
  end

    def destroy_task(id)
      @tasks.delete(id)
    end

    def create_employee(data)
      @employee_count += 1
      data[:id] = @employee_count
      data = @employee[data[:id]]
      build_employee(data)
    end

    def get_employee(id)
      data = @projects[id]
      build_employee(data) if !data.nil?
    end

    def update_employee(id, data)
      @employees[id].merge!(data)
      build_employee(@employee[id])
    end

    def delete_employee(id)
      @employees.delete(id)
    end

    def add_task_to_project(data)
     TM::Task.new(data[:description], [:priority_no], [:project_id])
      data = @tasks[data.id]

      @tasks[task.id]
      # You're not creating the relationship between task and project
    end

    def get_all_tasks_for_project(project_id)
      tasks = []
      @tasks.select  do |a, b|
        if b[:project_id] == project_id
          tasks.push(build_task(b))
        end
        tasks
      end
    end

    def get_all_completed_tasks_for_project(project_id)
      completed_tasks = @tasks.values.select do |task|
      task.project_id == project_id && task.completed
    end
     completed_tasks
    end

     def get_remaining_tasks_for_project(project_id)
      remaining_tasks = @tasks.values.select do |task|
      task.project_id == project_id && !task.completed
    end
     remaining_tasks
    end

    def get_completed_employee_tasks(employee_id)
      employee_tasks = @tasks.values.select do
       |task| task.employee_id == employee_id && task.completed == true
     end
     employee_tasks
    end

    def get_remaining_employee_tasks(employee_id)
      employee_tasks = @tasks.values.select do |task|
        task.employee_id == employee_id && task.completed == false
      end
      employee_tasks
    end

    def add_employee_to_project(project_id, employee_id)
      project = get_project(project_id)
      employee = get_employee(employee_id)
      @memberships.push({
        p_id: project.id,
        e_id: employee.id}
        )
    end

    def get_project_membership(project_id)
      # implement this
      project_employees = []
      @memberships.select do |member|
        member.select do |key, value|
          project_employees << value if key == project_id
        end
      end
      project_employees
      end

    def get_employee_membership(employee_id)
      employee_projects = []
      @memberships.select do |member|
        member.select do |key, value|
          employee_projects << key if value == employee_id
        end
      end

      employee_projects
    end

    def build_employee(data)
      TM::Employee.new(data[:name], data[:id])
    end

    def build_task(data)
      TM::Task.new(data)
      #TM::Task.new(data[:name], data[:id], data[:description], data[:create_time], data[:complete])
    end

    def build_project(data)
      TM::Project.new(data)
    end
  end

  def self.db
    @__db_instance ||= DB.new
  end
end











