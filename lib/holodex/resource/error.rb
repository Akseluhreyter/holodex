class Holodex
  class ResourceError < StandardError
    attr_reader :http_code, :data

    def initialize(http_code, data)
      @http_code = http_code
      @data = data
      super("Holodex returned an HTTP #@http_code with the following payload: #@data")
    end

    def [](key)
      @data[key]
    end
  end # Error
end
