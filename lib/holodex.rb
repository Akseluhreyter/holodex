require 'net/http'
require 'json'

require_relative 'holodex/resource/error'

require_relative 'holodex/resource/live'
require_relative 'holodex/resource/videos'
require_relative 'holodex/resource/channel'
require_relative 'holodex/resource/related_videos'
require_relative 'holodex/resource/users_live'
require_relative 'holodex/resource/video'
require_relative 'holodex/resource/channels'
require_relative 'holodex/resource/video_search'
require_relative 'holodex/resource/comment_search'

# https://docs.holodex.net/
class Holodex
  BASE_API = 'https://holodex.net/api/v2'
  DEFAULT_HEADERS = { 'Content-Type' => 'application/json; charset=utf-8' }

  def initialize(api_key)
    @headers = DEFAULT_HEADERS.merge('X-APIKEY' => api_key)
  end

  private

  def encode_query(data)
    data.transform_keys!(&:to_s)
    data.transform_values! do |value|
      case value
      when Array then value.join(',')
      when true  then 1
      when false then 0
      else
        value
      end
    end

    URI.encode_www_form(data)
  end

  # Takes the reponse object from Net::HTTP.
  # By overloading this method, one can change how responses are parsed.
  def parse(response)
    if Net::HTTPSuccess === response
      JSON.parse(response.body)
    else
      raise ResourceError.new(response.code, JSON.parse(response.body))
    end
  end

  def get(path, **)
    query    = encode_query(**)
    uri      = URI(BASE_API + path + "#{'?' << query unless query.empty?}")
    response = Net::HTTP.get_response(uri, @headers)

    parse(response)
  end

  def post(path, **)
    payload  = JSON.generate(**)
    uri      = URI(BASE_API + path)
    response = Net::HTTP.post(uri, payload, @headers)

    parse(response)
  end
end
