class TimeHandler
  attr_reader :unknown

  KNOWN_FORMATS = {
    year: '%Y-',
    month: '%m-',
    day: '%d ',
    hour: '%H:',
    minute: '%M:',
    second: '%S'
  }.freeze

  def initialize(params)
    @unknown = []
    @formats = ''
    return unless params['format']
    process_formats(params['format'].split(','))
  end

  def time
    Time.now.strftime(@formats)
  end

  private

  def process_formats(formats)
    formats.each do |v|
      if KNOWN_FORMATS.key?(v.to_sym)
        @formats += KNOWN_FORMATS[v.to_sym]
        next
      end
      @unknown << v
    end
  end
end