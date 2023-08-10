Ruby wrapper for the [Holodex API](https://docs.holodex.net/).

## Table of Contents
- [Getting Started](#getting-started)
- [Usage](#usage)
  - [Query Live and Upcoming Videos](#query-live-and-upcoming-videos)
  - [Query Videos](#query-videos)
  - [Query Channel Information](#query-channel-information)
  - [Query Videos Related to Channel](#query-videos-related-to-channel)
  - [Quickly Access Live / Upcoming for a set of Channels](#quickly-access-live-upcoming-for-a-set-of-channels)
  - [Get a Single Video's Metadata](#get-a-single-videos-metadata)
  - [List Channels](#list-channels)
  - [post-search-videoSearch](#post-search-videosearch)
  - [post-search-commentSearch](#post-search-commentsearch)

## Getting Started
1. [Obtain an API key.](https://docs.holodex.net/#section/Getting-Started/Obtaining-API-Key).
2. ``gem install holodex``

## Usage
```ruby
require 'holodex'

holodex = Holodex.new(ENV['HOLODEX_API_KEY'])
```

Each resource is represented by a method. Please refer to the [documentation](https://docs.holodex.net) for the parameters that can be passed.
The following sections show minimal examples how one might query the API with the aforementioned methods.

## Query Live and Upcoming Videos
```ruby
holodex.live(channel_id: 'UCL_qhgtOy0dy1Agp8vkySQg', status: 'upcoming')
```

## Query Videos
```ruby
holodex.videos(org: 'Hololive', topic: 'singing')
```

## Query Channel Information
```ruby
holodex.channel('UC3n5uGu18FoCy23ggWWp8tA')
```

## Query Videos Related to Channel
```ruby
holodex.related_videos('UCO_aKKYxn4tvrqPjcTzZ6EQ', 'clips', limit: 3)
```

## Quickly Access Live Upcoming for a set of Channels
```ruby
holodex.users_live('UCq4ky2drohLT7W0DmDEw1dQ', 'UC3n5uGu18FoCy23ggWWp8tA', 'UC_sFNM0z0MWm9A6WlKPuMMg')
```

## Get a single Video's metadata
```ruby
holodex.video('QI96hnhcr2E')
```

## List Channels
```ruby
holodex.channels(org: 'Hololive', type: 'vtuber')
```

## post-search-videoSearch
```ruby
holodex.video_search(lang: ['en'], target: ['stream'], topic: ['Pokemon_Unite'], limit: 3)
```

## post-search-commentSearch
```ruby
holodex.comment_search(org: ['Hololive'], comment: ["let's go"], limit: 1)
```

### Notes
- [post-search-videoSearch](https://docs.holodex.net/#operation/post-search-videoSearch) and [post-search-commentSearch](https://docs.holodex.net/#operation/post-search-commentSearch) resources are misdocumented.

  1. ``sort``, ``offset``, and ``limit`` parameters are not required. However, without setting a limit the request will typically timeout.
  2. The ``comment`` parameter for comment search should be an array of strings.

  See [this Discord conversation](https://discord.com/channels/796190073271353385/801759432450375700/1104481994982830168) for details.

- One can trivially affect how parsing is done by overloading the private method #parse.
  
  For example, if one didn't want any response parsing or exception raising done at all:
  ```ruby
  def parse(response) = response.body
  ```
