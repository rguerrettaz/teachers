# Job to be done:
# Relationships:

class NewsItem < ActiveRecord::Base

  include ApplicationHelper
  include TumblrHelper
  include TweetHelper

  has_many :comments

  attr_accessible :published_at, :source, :source_user, :source_url, :format, :tags,
              :vote, :popularity, :body, :title, :caption, :photo_urls, :asking_name,
              :asking_url, :question, :answer, :profile_pic, :source_id, :source_full_name,
              :source_user_url

  # def initialize(options={})
  #   @source_id = options[:source_id]
  #   @published_at = options[:published_at]
  #   @source = options[:source]
  #   @profile_pic = options[:profile_pic]
  #   @source_user = options[:source_user]
  #   @source_url = options[:source_url]
  #   @type = options[:type]

  #   @content_url = options[:content_url]

  #   @tags = options[:tags]
  #   @popularity = options[:popularity]

  #   @body = options[:body]
  #   @title = options[:title]

  #   @caption = options[:caption]

  #   @photo_urls = options[:photo_urls]

  #   @asking_name = options[:asking_name]
  #   @asking_url = options[:asking_url]

  #   @question = options[:question]
  #   @answer = options[:answer]

  # end


end


