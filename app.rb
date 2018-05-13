require_relative 'time_handler'

class App
  def call(env)
    request = Rack::Request.new(env)
    time_handler = TimeHandler.new(request.params)
    response(200, time_handler.time)
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
