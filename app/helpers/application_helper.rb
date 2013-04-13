module ApplicationHelper

  TAG_SEARCH = 5
  TAGS = ['education', 'edtech']

  def source
    
  end
  
  def popularity(vote, created_at)
    created_at = created_at.to_time.to_i unless created_at.class == Fixnum

    hours = ((Time.now.to_i - created_at) / 60) / 60
    popularity = (((vote.to_i - 1) / ((hours + 2) ** 1.5))*10).ceil
  end

  
  def tweets
    search = Twitter.search('#edchat OR #education', :count => 10, :result_type => 'popular').statuses

    search.map do |status|
      popularity = popularity(status.retweet_count + status.favorite_count, status.created_at)
      { 'popularity' => popularity, 'status' => status }
    end

  end

  def instas
    search = Instagram.tag_recent_media('edchat', :count => 5)

    search.map do |pic|
      popularity = popularity(pic.likes.count + pic.comments.count, pic.created_time.to_i)
      { 'popularity' => popularity, 'pic' => pic }
    end

  end

end
