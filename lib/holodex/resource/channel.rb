class Holodex
  # https://docs.holodex.net/docs/holodex/5dfaf299ea9fd-get-channel-information
  def channel(id) = get("/channels/#{id}")
end
