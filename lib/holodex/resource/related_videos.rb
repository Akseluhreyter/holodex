class Holodex
  # https://docs.holodex.net/#operation/get-v2-channels-channelId-clips
  def related_videos(id:, type:, **) = get("channels/#{id}/#{type}", **)
end
