require 'spec_helper'


describe TM::DB do

  let(:db) {TM::DB.new }
  describe 'db as a singleton' do
    it "returns a DB object" do
      expect(db).to be_a(TM::DB)
    end
  end

  context "Initialize with empy hash and empty array" do
    it "initialize with empty hash for projects, tasks, employees and employee_group" do
      db.projects.should == Hash.new
      db.tasks.should == Hash.new
      db.employees.should == Hash.new
      db.membership.should == Array.new
    end

    it "initial id_count_should be zero" do
      db.project_count.should == 0
      db.task_count.should == 0
      db.employee_count.should == 0
    end
  end

    context "#create_project" do
      it "creates a new project entity" do
        data = {:name => "project1", :id => 1}
        db.create_project(data)
        db.project_count.should == 1
        db.projects[1][:id].should == 1
        db.projects[1][:name].should == "project1"
      end

      it "gives a unique id every time" do
        project1 = db.create_project(:name => "project1")
        project2 = db.create_project(:name => "project1")
        project1.id.should_not == project2.id
      end

      it "create more projects with proper data" do
        data = {:name => "Project NYC", :id => 1}
        project1 = db.create_project(data)
        project1.class.should == TM::Project
        db.projects[1][:id].should == 1
        db.projects[1][:name].should == "Project NYC"

        data = {:name => "Project MD", :id => 2}
        project2 = db.create_project(data)
        project2.class.should == TM::Project
        db.projects[2][:id].should == 2
        db.projects[2][:name].should == "Project MD"

        data = {:name => "Project TX", :id => 3}
        project3 = db.create_project(data)
        project3.class.should == TM::Project
        db.projects[3][:id].should == 3
        db.projects[3][:name].should == "Project TX"

        total_project = db.projects.size
        total_project.should == 3
      end
    end

    context "#get_project" do
      it "returns a project entity with the proper data" do
        db.create_project(:name => "Game App", :id => 1)
        db.create_project(:name => "Guess Game", :id => 2)
        db.create_project(:name => "Data Collector", :id => 3)
        p1 = db.get_project(1)
        p2 = db.get_project(2)
        p3 = db.get_project(3)
        p1.name.should == "Game App"
        p3.id.should == 3
      end

      it "returns nil if the project doesn't exist or invalid argument" do
        project = db.get_project(0)
        project.should be_nil
    end
    end

    context "#update_project" do
      it "updates the project in the database" do
        p1 = db.create_project(:name => "Sinatra")
        db.update_project(p1.id, :name => "Tic Tac")
        project = db.get_project(p1.id)
        project.name.should == "Tic Tac"
        project.id.should == p1.id
      end
    end

    context "#destroy_project" do
      it "destroys project from project database" do
        p1 = db.create_project(:name => "Project Guterberg")
        db.destroy_project(p1.id)
        project = db.get_project(p1.id)
        project.should be_nil
        db.projects.size.should == 0
      end
    end

    context 'create_task ' do
    xit "increase number of tasks after every added task" do
      task1 = db.create_task(name: "Machine", id: 1, description: "Machine Builder")
      task2 = db.create_task(name: "Data", id: 2, description: "Data Projector")
      task3 = db.create_task(name: "Elevator", id: 3, description: "Elevator Cleaner")
      db.tasks[1][:name].should == "Machine"
      db.tasks[2][:id].should == 2
      db.tasks[3][:description].should == "Elevator Cleaner"
      all_tasks = db.tasks.size
      all_tasks.should == 3
    end
  end

  context 'get_task' do
    it "returns nil if the task doesn't exist" do
      task = db.get_task(1)
      task.should be_nil
    end

    xit "returns the task with correct task data " do

      db.create_task(:name => "Machine", :id => 1, :description => "Machine Builder")
      db.create_task(:name => "Data", :id => 2, :description => "Data Projector")
      db.create_task(:name => "Elevator", :id => 3, :description => "Elevator Cleaner")

      db.tasks.size.should == 3

      task1 = db.get_task(1)
      task2 = db.get_task(2)
      task1.class.should == TM::Task
      task1.name.should == "Machine"
      task1.id.should == 1
      task2.class.should == TM::Task
      task2.name.should =="Data"
      task2.id.should == 2
    end
  end

  context 'update_task' do
    it "return nil if no tasks exist" do
      data = { name: "Buy Eggs", id: 1, description: "One Dozen"}
      task1 = db.update_task(1, data)
      task1.should be_nil
      db.tasks.size.should == 0
    end
  end

   context "#create_employee" do
      xit "creates a employee entity" do
        data = {:name => "employee1", :id => 1}
        db.create_employee(data)
        db.employee_count.should == 1
        db.employees[1][:id].should == 1
        db.employees[1][:name].should == "employee1"
      end

      xit "gives a unique id every time" do
        employee1 = db.create_employee(:name => "employee1")
        employee2 = db.create_employee(:name => "employee1")
        employee1.id.should_not == employee2.id
      end

      xit "create more employees with proper data" do
        data = {:name => "Mikael", :id => 1}
        employee1 = db.create_employee(data)
        employee1.class.should == TM::Employee
        db.employees[1][:id].should == 1
        db.employees[1][:name].should == "Mikael"

        data = {:name => "Shetim", :id => 2}
        employee2 = db.create_employee(data)
        employee2.class.should == TM::Employee
        db.employees[2][:id].should == 2
        db.employees[2][:name].should == "Shetim"

        data = {:name => "MM", :id => 3}
        employee3 = db.create_employee(data)
        employee3.class.should == TM::Employee
        db.employees[3][:id].should == 3
        db.employees[3][:name].should == "MM"

        total_employee = db.employees.size
        total_employee.should == 3
      end
    end

    context 'get_project_membership' do
    it 'should returns memberships based on project id' do
      project = db.create_project(:name => "Game App", :id => 1)
      employee = db.create_employee(:name => "Billy", :id => 1)
      employee2 = db.create_employee(:name => "Tunji", :id => 1)
      membership = db.add_employee_to_project(project.id, employee.id)
      membership2 = db.add_employee_to_project(project.id, employee2.id)
      project_memberships = db.get_project_membership(project.id)

      project_memberships.should_not be_nil
      project_memberships.first.should == employee.id
      project_memberships.last.should == employee2.id

    end
  end

end








