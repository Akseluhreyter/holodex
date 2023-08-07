class Holodex
  # https://docs.holodex.net/docs/holodex/ba328f7332280-query-videos
  def videos(**) = get('/videos', **)
end
