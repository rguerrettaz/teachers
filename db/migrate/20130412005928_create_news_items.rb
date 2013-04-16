class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
		t.string :published_at
		t.string :source
		t.string :source_user
		t.string :source_url
		t.string :format
		t.string :tags
		t.string :vote
		t.string :popularity
		t.text   :body
		t.string :title
		t.string :caption
		t.string :photo_urls
		t.string :asking_name
    t.string :asking_url
    t.string :question
    t.string :answer
    t.string :profile_pic
    t.string :source_id
   
    t.timestamps
    end
  end
end
