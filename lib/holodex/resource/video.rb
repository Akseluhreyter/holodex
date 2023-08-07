class Holodex
  # https://docs.holodex.net/docs/holodex/d18465c977416-get-a-single-video-s-metadata
  def video(id, lang: nil, c: nil) = get("/videos/#{id}", lang:, c:)
end
