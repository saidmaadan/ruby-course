module Tweet

class PostTextTweet

  def run(input)
    if input[:content].length > 140
      return {:success? => false, :error => "Exceed character limit"}
    end
    t = Tweet.db.create_text_tweet(content: input[:content])
    if t.nil?
      return {:success? => false, :error => "Your could not be store into database"}
    end
    tags = input[:tag].map do |tag|
     tag = Tweet.db.get_or_create_tag(tag: tag)
    end
    tags.each do |tag|
      Tweet.db.create_text_tag(t.id, tag.id)
    end
  end
  {
    :success? => true,
    :tweet => t,
    :tags => tag
  }
end

Class PostPicTweet

  def run(upload)
    return {:success? => false, :error => "Exceed upload size limit"} if upload[:pic_url].size > 1000kb
    pic = Tweet.create_pic_tweet[pic_url: upload[:pic_url]]
    return {:success? => false, :error => "Your image could not be store into database"} if pic.nil?

    tags = input[:tag].map do |tag|
     tag = Tweet.db.get_or_create_tag(tag: tag)
    end
    tags.each do |tag|
      Tweet.db.create_pic_tag(pic.id, tag.id)
    end
  end

end





pttweet = PostTextTweet.run{
  content: "This goes inside ClientTerminal",
  tags: ["terminal", "client"]
}
if pttweet[:success? => true]
  puts "You are successfully posted your data"
else
  puts "Your post not save into database "

}


pic_tweet = PostPicTweet.run{
  pic_url: "This goes inside ClientTerminal",
  tags: ["terminal", "client"]
}
if pic_tweet[:success? => true]
  puts "You are successfully uploaded your image"
else
  puts "Your image not save into database "

}

