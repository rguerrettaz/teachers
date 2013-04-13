module ApplicationHelper

  def popularity(vote, created_at)
    hours = ((Time.now - created_at.to_time) / 60) / 60
    popularity = (((vote.to_i - 1) / ((hours + 2) ** 1.5))*10).ceil
  end

  def tumbles
    client = Tumblr::Client.new
    search = client.tagged('education', :limit => 5)

    search.map do |post|
      popularity = popularity(post['note_count'], post['date'])
      post.merge!({'popularity' => popularity })
    end

  end
  
  def tweets
    search = Twitter.search('#edchat OR #education', :count => 10, :result_type => 'popular').statuses

    search.map do |status|
      popularity = popularity(status.retweet_count, status.created_at)
      { 'popularity' => popularity, 'status' => status }
    end

  end


end
