module TumblrHelper
  include ApplicationHelper

  def tumblr_search
    client = Tumblr::Client.new
    posts = TAGS.map do |tag|
      client.tagged(tag, :limit => TAG_SEARCH)
    end
    posts.flatten!
  end


  def from_tumblr
    tumbles = tumblr_search.map do |post|
      if post['type'] == 'text'
        body = post['body']
        title = post['title']

      elsif post['type'] == 'quote'
        body = post['text']
        caption = post['source']

      elsif post['type'] == 'chat'
        title = post['title']
        body = post['dialogue']

      elsif post['type'] == 'link'
        body = post['title']
        caption = post['description']

      elsif post['type'] == 'photo'
        caption = post['caption']
        photo_urls = post['photos'].first['original_size']['url'] if post['photos']

      elsif post['type'] == 'audio'
        body = post['player']

      elsif post['type'] == 'video'
        body = post['embed_code']

      elsif post['type'] == 'answer'
        asking_name = post['asking_url']
        asking_url = post['asking_name']
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
end
