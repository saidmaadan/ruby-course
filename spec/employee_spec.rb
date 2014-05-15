require 'spec_helper'

describe 'Employee' do
  it 'exists' do
  expect(TM::Employee).to be_a(Class)
  end
  xit 'has initial name and unique id' do
    employee1 = TM::Employee.new("Mikael")
    employee1.name.should == "Mikael"
    employee1.id.should == 1
  end
end
