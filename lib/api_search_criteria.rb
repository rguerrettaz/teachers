require 'json'
require 'open-uri'

module ApiSearchCriteria

  extend self

  def item_limit
    5
  end

  def tags
    ['education', 'edchat']
  end

  def calculate_popularity(vote, created_at)
    created_at = published_date(created_at)

    time = Time.now - created_at

    hours = ((time.to_i) / 60) / 60

    (((vote.to_i - 1) / ((hours + 2) ** 1.5))*10).round
  end

  def published_date(created_at)
    if created_at.respond_to?(:to_time)
      created_at.to_time.utc
    else
      Time.at(created_at.to_i).utc
    end

  end

end
