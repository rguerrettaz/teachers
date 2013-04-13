module ApplicationHelper

  def add_popularity(posts)

    posts.map do |post|
      hours = ((Time.now - post['date'].to_time) / 60) / 60

      popularity = (post['note_count'].to_i - 1) / ((hours + 2) ** 1.5)

      post.merge!({'popularity' => (popularity * 10).ceil })
    end
    
  end
  

end
