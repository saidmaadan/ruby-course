require 'spec_helper'


describe 'AssignTaskToEmployee' do
  before do
    @db = TM::DB.new
  end

  xit "adds a task to an employee" do
    # Set up our data
    task = @db.create_task('make me a sandwich')
    emp = @db.create_employee('Bob')

    result = subject.run({ :task_id => task.id, :employee_id => emp.id })
    expect(result.success?).to eq true
    expect(result.task.employee_id).to eq(emp.id)
  end

  xit "errors if the task does not exist" do
    # Set up our data
    emp = @db.create_employee('Bob')

    result = subject.run({ :task_id => 999, :employee_id => emp.id })
    expect(result.error?).to eq true
    expect(result.error).to eq :task_does_not_exist
  end
end
