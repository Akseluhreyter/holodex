class Holodex
  # https://docs.holodex.net/#operation/post-search-commentSearch
  def comment_search(**) = post('/search/commentSearch', **)
end
