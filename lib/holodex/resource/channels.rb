class Holodex
  # https://docs.holodex.net/docs/holodex/4fd0f20623a29-list-channels
  def channels(**) = get('/channels', **)
end
