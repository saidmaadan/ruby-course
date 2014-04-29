require 'rubygems'
require 'rspec'
require 'pry-debugger'
require_relative '../exercises.rb'


describe 'Exercise' do
  describe '.ex0' do
  it "triples the length of a string" do
    result = Exercises.ex0("ha")
    expect(result).to eq("hahaha")
  end

  it "returns 'nope' if the string is 'wishes'" do
    result = Exercises.ex0("wishes")
    expect(result).to eq("nope")
  end
end
  describe '.ex1' do
  it "returns the total number element of an array "do
  expect(Exercises.ex1([1, 3, 4])).to eq(3)
  expect(Exercises.ex1([1, 3, 4, 5])).to eq(4)
  end
end

describe '.ex2' do
  it "returns the second element of an array "do
  expect(Exercises.ex2([1, 3, 4])).to eq(3)

  end
end

describe '.ex3' do
it "should returns the sum of array" do
  expect(Exercises.ex3([10, 10])).to eq(20)
  expect(Exercises.ex3([15, 10, 10])).to eq(35)
  expect(Exercises.ex3([30, 40, 20])).to eq(90)
    end
  end

describe '.ex4' do
it "should returns the max number of an array" do
  expect(Exercises.ex4([10, 10])).to eq(10)
  expect(Exercises.ex4([1, 10, 10])).to eq(10)
  expect(Exercises.ex4([10, 10, 20])).to eq(20)
    end
  end

describe '.ex5' do
it 'should call puts with the element an array ' do
  STDOUT.should_receive(:puts).with('a')
  STDOUT.should_receive(:puts).with('b')
  STDOUT.should_receive(:puts).with('c')
  Exercises.ex5(['a','b','c'])
end
end

describe '.ex7' do
it "should add string to the end of array if it exist" do
  result = Exercises.ex7([1,2,'str',3,4], 'str')
  expect(result).to eq('str')
  end
end

describe 'ex8' do
  it "iterates throught the people hash and prints out key and values" do
    # Exercises.ex8({ :name => "Bob"})
    STDOUT.should_receive(:puts).with("Bob" : "Builder")
    Exercises.ex8({ :name => "Bob", :occupation => "Builder"})
  end
end







end




