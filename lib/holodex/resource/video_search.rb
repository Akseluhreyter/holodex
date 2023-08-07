class Holodex
  # https://docs.holodex.net/#operation/post-search-videoSearch
  def video_search(**) = post('/search/videoSearch', **)
end
