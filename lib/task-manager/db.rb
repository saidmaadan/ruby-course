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
      @project_count += 1
      data[:id] = @project_count
      data = @projects[data[:id]]
      build_project(data)
    end


    def get_project(id)
      data = @projects[id]
      if !data.nil?
        build_project(data)
      # TM::Project.new(data[:name], data[:id])
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
      @projects.each do |id, data| list << build_project(data)
      end
      list
  end

    def create_task(data)
      data[:id] ||= @task_count + 1
      return nil if @tasks[data[:id]]
      @task_count +=1
      @tasks[data[:id]] = data

    end

    def get_task(id)
      build_task(@tasks[id]) if @tasks[id]
    end

    def update_task(id, data)
       return nil unless @tasks[id]
      @tasks[id].merge!(data)
      build_task
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
      if !data.nil?
      build_employee
    end

    def update_employee(id, data)
      @employees[id].merge!(data)
      build_employee
    end

    def delete_employee(id)
      @employees.delete(id)
    end

    def add_task_to_project(task)
        task = Task.new(description, priority, project_id)
        @tasks[task.id] = task
        @tasks[task.id]
    end

    def get_project_membership(id)
        project_employees = []
        @memberships.select do |member|
          member.select do |key, value|
            project_employees << value if key == pid
          end
        end
        project_employees
      end

    def get_employee_membership(id)
      employee_projects = []
      @memberships.select do |member|
        member.select do |key, value|
          employee_projects << key if value == id
        end
      end
      employee_projects
    end

    def add_employee_to_project(project_id, employee_id)
        project = get_project(project_id)
        employee = get_employee(employee_id)
        @memberships.push({project.id => employee.id})
      end



    def build_employee(data)
      Employee.new(data[:name], data[:id])
    end

    def build_task(data)
      Task.new(data[:name], data[:desc], data[:id])
    end

    def build_project(data)
      Project.new(data[:name], data[:id])
    end
  end
end









