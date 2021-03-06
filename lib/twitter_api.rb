module TwitterApi
  extend self
  def twitter_search
    posts = ApiSearchCriteria.tags.map do |tag|
      Twitter.search(tag, :result_type => 'popular', :include_entities => true )
    end
  end

  def from_twitter
    tweets = twitter_search.map do |tag|
      tag.statuses.map do |tweet|
        next if NewsItem.find_by_source_id(tweet.id.to_s).present?
        NewsItem.create(
          :published_at => tweet.created_at,
          :source => 'twitter',
          :source_id => tweet.id,
          :source_user => tweet.from_user,
          :source_user_url => "https://twitter.com/"+tweet.from_user,
          :source_url => "https://twitter.com/" + tweet.from_user + "/status/" + tweet.id.to_s,
          :profile_pic => tweet.profile_image_url,
          :format => 'status',
          :popularity => ApiSearchCriteria.calculate_popularity((tweet.favorite_count + tweet.retweet_count), tweet.created_at),
          :body => tweet_body(tweet.full_text, [tweet.hashtags, tweet.urls, tweet.user_mentions]),
                )
      end
    end
    tweets.flatten!
  end

  def entity_to_html(text, entity)
    entity.map do |entity|

        if entity.respond_to?('text')
          text.gsub!("##{entity.text}", "<a href='https://twitter.com/search?q=#{entity.text}'>##{entity.text}</a>")

        elsif entity.respond_to?('url')
          text.gsub!("#{entity.url}", "<a href ='#{entity.url}'>#{entity.url}</a>")

        elsif entity.respond_to?('screen_name')
          text.gsub!("@#{entity.screen_name}","<a href ='https://twitter.com/#{entity.screen_name}'>@#{entity.screen_name}</a>")
        end
        text
      end
    end

  def tweet_body(text, entities=[])
    entities.map do |entity|
      entity_to_html(text, entity)
    end
    text
  end
  
end