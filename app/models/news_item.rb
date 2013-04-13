class NewsItem

  include ApplicationHelper
  include TumblrHelper

  attr_reader :published_at, :source, :source_user, :source_url, :type, :tags,
              :vote, :popularity, :body, :title, :caption, :photo_urls, :asking_name,
              :asking_url, :question, :answer

  def initialize(options={})
    @published_at = options[:published_at]
    @source = options[:source]
    @source_user = options[:source_user]
    @source_url = options[:source_url]
    @type = options[:type]

    @tags = options[:tags]
    @popularity = options[:popularity]

    @body = options[:body]
    @title = options[:title]

    @caption = options[:caption]

    @photo_urls = options[:photo_urls]
    
    @asking_name = options[:asking_name]
    @asking_url = options[:asking_url]

    @question = options[:question]
    @answer = options[:answer]

  end


end


