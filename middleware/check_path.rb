class CheckPath
  ALLOWED_PATHS = %w[/time].freeze

  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    current_path = request.path_info
    return @app.call(env) if ALLOWED_PATHS.include?(current_path)
    not_found
  end

  private

  def not_found
    [
      404,
      { 'Content-Type' => 'text/plain' },
      ['Page not found']
    ]
  end
end
