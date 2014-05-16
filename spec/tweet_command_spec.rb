require 'spec_helper'

describe 'PostTextTweet' do
  it "exists" do
    expect(PostTextTweet).to be_a(Class)
  end

  it "returns a TextTweet" do
    expect(Tweet.PostTextTweet). to be_a(PostTextTweet)
  end

  end

