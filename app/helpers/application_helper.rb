module ApplicationHelper

  TAG_SEARCH = 5
  TAGS = ['education', 'edchat']


  def calculate_popularity(vote, created_at)
    created_at = published_date(created_at)

    time = Time.now - created_at

    hours = ((time.to_i) / 60) / 60

    (((vote.to_i - 1) / ((hours + 2) ** 1.5))*10).round
  end

  def source_user_url(item)
    return "https://#{item.source}.com/#{item.source_user}" if item.source == 'twitter' || 'instagram'
    return "https://reddit.com/user/#{item.source_user}" if item.source == 'reddit'
    return "https://#{item.source_user}.tumblr.com" if item.source == 'tumblr'

  end

  def published_date(created_at)
    if created_at.class == String
      created_at.to_time.utc
    else
      Time.at(created_at.to_i).utc
    end
  end

  def max_post_length
    600
  end

end
 
