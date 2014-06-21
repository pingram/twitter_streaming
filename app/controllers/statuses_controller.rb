require 'sse'

class StatusesController < ApplicationController
  include ActionController::Live

  def events
    response.headers['Content-Type'] = 'text/event-stream'

    3.times do |n|
      response.stream.write "data: #{n}...\n\n"
      sleep 2
    end

  rescue IOError
    logger.info "Stream closed"
  ensure
    response.stream.close

    # sse = Reloader::SSE.new(response.stream)

    # begin
    #   loop do
    #     sse.write({ :time => Time.now })
    #     sleep 1
    #   end
    # rescue IOError

    # ensure
    #   sse.close
    # end
        
    # tw = TwitterStream.new
    # tw.open_stream
    
    # @tweets = Status.where(user_id: 1).reverse
  end

  def index
  end
end