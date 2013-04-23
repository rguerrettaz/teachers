require 'json'
require 'open-uri'

module Api
  module ClassMethods  
    def call_api(zip,state,city) 
      results = 
        if zip.blank? && city.blank?
          JSON.parse(open("http://api.education.com/service/service.php?resf=json&f=schoolSearch&key=410e1967497cd724f524a35879ffc078&sn=sf&v=4&state=#{state}").read)
        elsif zip.blank?
          JSON.parse(open("http://api.education.com/service/service.php?resf=json&f=schoolSearch&key=410e1967497cd724f524a35879ffc078&sn=sf&v=4&state=#{state}&city=#{URI::encode(city).downcase}").read)
        elsif city.blank?
          JSON.parse(open("http://api.education.com/service/service.php?resf=json&f=schoolSearch&key=410e1967497cd724f524a35879ffc078&sn=sf&v=4&state=#{state}&zip=#{zip.to_i}").read)
        else 
          JSON.parse(open("http://api.education.com/service/service.php?resf=json&f=schoolSearch&key=410e1967497cd724f524a35879ffc078&sn=sf&v=4&state=#{state}&zip=#{zip.to_i}&city=#{URI::encode(city).downcase}").read)
        end

      results.each do |result| 
        School.create(parse_result_to_school_attrs(result))
      end

      def parse_result_to_school_attrs(result)
        school = result['school']
        school_attrs = school.extract!(
          "schoolid",
          "schoolname",
          "schoolname",
          "zip""address",
          "districtid",
          "AYPResultYear",
          "distance",
          "gradelevel",
          "gradesserved",
          "latitude",
          "longitude",
          "phonenumber",
          "schooldistrictname",
          "schooltype",
          "state",
          "website",
          "testrating_text",
          "testrating_year")
        school_attrs.merge!(
          :city                 =>  school["city"].downcase,
          :studentteacherratio  =>  school["studentteacherratio"]['total'],
          :enrollment           =>  school["enrollment"]['total']
        )
        school_attrs
      end


    end
  end

  def self.included(receiver)
    receiver.extend ClassMethods
  end

  #NewsItem Popularity

  TAG_SEARCH = 5
  TAGS = ['education', 'edchat']


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

  #Instagram Search
  def insta_search
    Instagram.tag_recent_media('edchat', :limit => TAG_SEARCH*2)
  end

  def from_insta
    insta_search.map do |pic|
      next if NewsItem.find_by_source_id(pic.caption.id.to_s).present? || pic.caption.blank?
      NewsItem.create(:published_at => pic.created_time,
                  :source_id =>  pic.caption.id,   
                  :source => 'instagram',
                  :source_user => pic.caption.from.username,
                  :source_user_url => "https://instagram.com/"+ pic.caption.from.username,
                  :source_url => "https://instagram.com/"+ pic.caption.from.username,
                  :format => 'photo',
                  :popularity => calculate_popularity((pic.comments.count + pic.likes.count), pic.caption.created_time.to_i ),
                  :caption => pic.caption.text,
                  :photo_urls => pic.images.standard_resolution.url
      )
    end
  end

  # Tumblr Search
  def tumblr_search
        client = Tumblr::Client.new
        posts = TAGS.map do |tag|
          client.tagged(tag, :limit => TAG_SEARCH)
        end
        posts.flatten!
      end


      def from_tumblr
        tumbles = tumblr_search.map do |post|
          next if NewsItem.find_by_source_id(post['id'].to_s).present?

          if post['type'] == 'text'
            body = post['body']
            title = post['title']

          elsif post['type'] == 'quote'
            body = post['text']
            caption = post['source']

          elsif post['type'] == 'chat'
            title = post['title']
            body = dialogue(post['dialogue'])

          elsif post['type'] == 'link'
            body = post['title']
            caption = post['description']

          elsif post['type'] == 'photo'
            caption = post['caption']
            photo_urls = post['photos'].first['original_size']['url'] if post['photos']

          elsif post['type'] == 'audio'
            body = post['player']

          elsif post['type'] == 'video'
            body = post['player'][1]['embed_code']

          elsif post['type'] == 'answer'
            asking_name = post['asking_name']
            asking_url = post['asking_url']
            question = post['question']
            answer = post['answer']
          end
          NewsItem.create(:published_at => post['date'],
                        :source_id => post['id'],
                        :source => 'tumblr',
                        :source_user => post['blog_name'],
                        :source_url => post['post_url'],
                        :source_user_url => "https://"+post['blog_name']+".tumblr.com",
                        :format => post['type'],
                        :popularity => calculate_popularity(post['note_count'], post['date']),
                        :body => body,
                        :title => title,
                        :photo_urls => photo_urls,
                        :question => question,
                        :answer => answer,
                        :asking_name => asking_name,
                        :asking_url => asking_url,
                        :caption => caption
                      )
        end
    end

    def dialogue(raw)
      dialogue = ""
      raw.each do |line|
        dialogue += "<p>#{line['label']}<span>#{line['phrase']}</span></p>"
      end
      dialogue
    end

    #Twitter Search
    def twitter_search    
    posts = TAGS.map do |tag|
      Twitter.search(tag, :result_type => 'popular', :include_entities => true )
    end
    end

    def from_twitter
      tweets = twitter_search.map do |tag|
        tag.statuses.map do |tweet|
          next if NewsItem.find_by_source_id(tweet.id.to_s).present?
          NewsItem.create(:published_at => tweet.created_at,
                        :source => 'twitter',
                        :source_id => tweet.id,
                        :source_user => tweet.from_user,
                        :source_user_url => "https://twitter.com/"+tweet.from_user,
                        :source_url => "https://twitter.com/" + tweet.from_user + "/status/" + tweet.id.to_s,
                                    :profile_pic => tweet.profile_image_url,
                        :format => 'status',
                        :popularity => calculate_popularity((tweet.favorite_count + tweet.retweet_count), tweet.created_at),
                        :body => tweet_body(tweet.full_text, [tweet.hashtags, tweet.urls, tweet.user_mentions]),
                                    # :location => tweet.coordinates,
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

    # Reddit Search
  def reddit_client
    client = Reddit::Api.new(USERNAME, PASSWORD)
  end

  def reddit_education
    reddit_client.browse('education', :limit => TAG_SEARCH)
  end

  def reddit_teachers
    reddit_client.browse('teachers', :limit => TAG_SEARCH)
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
                      :popularity => (calculate_popularity(submission.score, submission.created_utc))
                    )
      end
    end
    posts.flatten!
  end



end
