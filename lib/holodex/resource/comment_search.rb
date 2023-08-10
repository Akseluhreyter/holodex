class Holodex
  # https://docs.holodex.net/#operation/post-search-commentSearch
  def comment_search(comment:, **)
    post('/search/commentSearch', comment:, **)
  end
end
