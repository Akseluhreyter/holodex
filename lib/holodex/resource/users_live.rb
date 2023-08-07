class Holodex
  # https://docs.holodex.net/docs/holodex/f1e355dc4cb79-quickly-access-live-upcoming-for-a-set-of-channels
  def users_live(*channels) = get('/users/live', channels:)
end
