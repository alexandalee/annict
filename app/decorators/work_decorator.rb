class WorkDecorator < ApplicationDecorator
  include WorkDecoratorCommon

  def twitter_username_link
    url = "https://twitter.com/#{twitter_username}"
    h.link_to "@#{twitter_username}", url, target: "_blank"
  end

  def twitter_hashtag_link
    url = URI.encode("https://twitter.com/search?q=##{twitter_hashtag}&src=hash")
    h.link_to "##{twitter_hashtag}", url, target: "_blank"
  end

  def syobocal_link(title = nil)
    title = title.presence || sc_tid
    h.link_to title, syobocal_url, target: "_blank"
  end
end