class Comment < ActiveRecord::Base
  belongs_to :news_item
  belongs_to :user
  attr_accessible :content
end
