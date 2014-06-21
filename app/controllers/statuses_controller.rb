require 'sse'

class StatusesController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'

    sse = Reloader::SSE.new(response.stream)

    begin
      loop do
        sse.write({ :time => Time.now })
        sleep 1
      end
    rescue IOError

    ensure
      sse.close
    end
        
    # tw = TwitterStream.new
    # tw.open_stream
    
    # @tweets = Status.where(user_id: 1).reverse
  end
end