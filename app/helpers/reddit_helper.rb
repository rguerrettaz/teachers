module RedditHelper
  include ApplicationHelper

  def client
    client = Reddit::Api.new(USERNAME, PASSWORD)
  end

  def reddit_education
    client.browse('education', :limit => TAG_SEARCH)
  end

  def reddit_teachers
    client.browse('teachers', :limit => TAG_SEARCH)
  end

  def from_reddit  

    search = [reddit_teachers].flatten!
    posts = search.map do |submission|
      submission.comments.map do |comment|
        if submission.score > 0
          NewsItem.new( :published_at => submission.created_utc,
                        :source => 'reddit',
                        :source_user => comment.author,
                        :source_url => "http://www.reddit.com/#{submission.permalink}",
                        :type => 'quote',
                        :body => comment.body,
                        :caption => submission.title,
                        :tags => comment.subreddit, 
                        :popularity => (popularity(submission.score, submission.created_utc))
                      )
        end
      end
    end
    posts.flatten!
  end

  def source(title, permalink)
    
  end


end
