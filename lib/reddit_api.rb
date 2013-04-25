module RedditApi
  extend self
  def reddit_client
    client = Reddit::Api.new(USERNAME, PASSWORD)
  end

  def reddit_education
    reddit_client.browse('education', :limit => ApiSearchCriteria.item_limit)
  end

  def reddit_teachers
    reddit_client.browse('teachers', :limit => ApiSearchCriteria.item_limit)
  end

  def from_reddit

    search = [reddit_teachers, reddit_education].flatten!
    posts = search.map do |submission|
      submission.comments.map do |comment|

        next unless submission.score < 0 || NewsItem.find_by_source_id(comment.id.to_s).present?

        NewsItem.create( :published_at => submission.created_utc,
                      :source_id => comment.id,
                      :source => 'reddit',
                      :source_user => comment.author,
                      :source_user_url => "https://reddit.com/user/" + comment.author,
                      :source_url => "http://www.reddit.com/" + submission.permalink,
                      :format => 'quote',
                      :body => comment.body,
                      :caption => submission.title,
                      :popularity => (ApiSearchCriteria.calculate_popularity(submission.score, submission.created_utc))
                    )
      end
    end
    posts.flatten!
  end
end