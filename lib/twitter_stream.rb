class TwitterStream
  @@opened = false

  def open_stream
    if !@@opened
      Thread.new do
        puts 'opening twitter stream'
        @@opened = true
        client = TweetStream::Client.new

        client.userstream do |status|
          Status.create!(user_id: 1, text: status.text)
        end
      end
    else
      puts 'twitter stream already opened'
    end
  end
end