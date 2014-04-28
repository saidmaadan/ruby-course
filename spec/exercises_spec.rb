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
  xit "returns the total number element of an array "do
  expect(Exercises.ex1([1, 3, 4])).to eq(3)
  expect(Exercises.ex1([1, 3, 4, 5])).to eq(4)
  end
end

describe '.ex2' do
  xit "returns the second element of an array "do
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
STDOUT.should_receive(:puts).with(4)
Exercises.ex5([4])
end
end

describe '.ex6' do
  it "returns the last item in the array to panda " do


  expect(Exercises.ex1(array[1, 3, 4])).to eq(3)
  expect(Exercises.ex1([1, 3, 4, 5])).to eq(4)
  end
end








end




