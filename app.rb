require_relative 'time_handler'

class App
  def call(env)
    request = Rack::Request.new(env)
    time_handler = TimeHandler.new(request.params)
    if time_handler.unknown.empty?
      response(200, time_handler.time)
    else
      response(400, "Unknown time format #{time_handler.unknown}")
    end
  end

  private

  def response(status, body)
    [
        status,
        { 'Content-Type' => 'text/plain' },
        [body]
    ]
  end
end
