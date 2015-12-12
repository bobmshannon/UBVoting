require './tweetparser.rb'
puts 'hello'
tweet = Tweet.find_by(_id: 675776125591683072)
tp = TweetParser.new(tweet)
tweet = Tweet.find_by(_id: 675790116498120706)
tp = TweetParser.new(tweet)
