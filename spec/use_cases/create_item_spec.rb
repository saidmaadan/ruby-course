require 'spec_helper'


describe DoubleDog::CreateItem do

  let(:use_case) do
    use_case = DoubleDog::CreateItem.new
    expect(use_case).to receive(:admin_session?).and_return(@admin_session)
    use_case
  end

  before (:each) do
    @admin_session = true
  end

  describe 'Validation' do
    it "requires the user to be an admin" do
      @admin_session = false

      result = use_case.run(:name => "doesn't matter", :price => 5)
      expect(result[:success?]).to eq false
      expect(result[:error]).to eq :not_admin
    end

    it "requires a name" do

      result = use_case.run(:name => nil, :price => 5)
      expect(result[:success?]).to eq false
      expect(result[:error]).to eq :invalid_name
    end

    it "requires the name to be at least one character" do

      result = use_case.run(:name => '', :price => 5)
      expect(result[:success?]).to eq false
      expect(result[:error]).to eq :invalid_name
    end

    it "requires a price" do

      result = use_case.run(:name => 'x', :price => nil)
      expect(result[:success?]).to eq false
      expect(result[:error]).to eq :invalid_price
    end

    it "requires a price to be more than fiftey cents" do

      result = use_case.run(:name => 'y', :price => 0.4)
      expect(result[:success?]).to eq false
      expect(result[:error]).to eq :invalid_price
    end
  end

  it "creates an item" do

    result = use_case.run(:name => 'smoothie', :price => 10)
    expect(result[:success?]).to eq true

    item = result[:item]
    expect(item.id).to_not be_nil
    expect(item.name).to eq 'smoothie'
    expect(item.price).to eq 10
  end

end
