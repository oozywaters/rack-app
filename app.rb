class App
  def call(env)
    request = Rack::Request.new(env)
    response(200, request.inspect)
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
