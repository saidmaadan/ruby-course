require 'rubygems'
require 'rspec'
require 'pry-debugger'
require_relative '../exercises.rb'


describe 'Exercise' do
  describe '.ex1' do
  it "triples the length of a string" do
    result = Exercises.ex0("ha")
    expect(result).to eq("hahaha")
  end

  it "returns 'nope' if the string is 'wishes'" do
    result = Exercises.ex0("wishes")
    expect(result).to eq("nope")
  end
end
  describe '.ex2' do
  xit "returns the total number element of an array "do
  expect(Exercises.ex1([1, 3, 4])).to eq(3)
  expect(Exercises.ex1([1, 3, 4, 5])).to eq(4)
  end
end

describe '.ex3' do
  xit "returns the second element of an array "do
  expect(Exercises.ex1([1, 3, 4])).to eq(3)

  end
end

describe '.ex4' do
it "should returns the max number of an array" do
      expect(Exercises.ex4([10, 10])).to eq(10)
      expect(Exercises.ex4([1, 10, 10])).to eq(10)
      expect(Exercises.ex4([10, 10, 20])).to eq(20)
    end
  end

# describe '.ex5' do
# it 'should call puts with the element of a 1 element array ' do
# STDOUT.should_receive(:puts).with(10)
# Exercises.ex5[10]
# end
# end
end




