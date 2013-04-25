module Instagram
  def insta_search
    Instagram.tag_recent_media('edchat', :limit => TAG_SEARCH*2)
  end

  def from_insta
    insta_search.each do |pic|
      next if pic.caption.blank? # nil for weird instagram results
      NewsItem.find_by_source_id(pic.caption.id.to_s) or
      NewsItem.create(:published_at => pic.created_time,
                  :source_id =>  pic.caption.id,
                  :source => 'instagram',
                  :source_user => pic.caption.from.username,
                  :source_user_url => "https://instagram.com/" + pic.caption.from.username,
                  :source_url => "https://instagram.com/" + pic.caption.from.username,
                  :format => 'photo',
                  :popularity => calculate_popularity((pic.comments.count + pic.likes.count), pic.caption.created_time.to_i ),
                  :caption => pic.caption.text,
                  :photo_urls => pic.images.standard_resolution.url
      )
    end
  end

end