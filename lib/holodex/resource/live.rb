class Holodex
  # https://docs.holodex.net/docs/holodex/b675902a04ca9-query-live-and-upcoming-videos
  def live(**) = get('/live', **)
end
