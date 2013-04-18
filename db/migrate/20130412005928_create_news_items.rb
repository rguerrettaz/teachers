  class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
		t.string :published_at
		t.string :source
		t.string :source_user
    t.string :source_user_url
		t.string :source_url
		t.string :format
		t.integer :popularity
		t.text   :body
		t.string :title
		t.text   :caption
		t.string :photo_urls
		t.string :asking_name
    t.string :asking_url
    t.text   :question
    t.text   :answer
    t.string :profile_pic
    t.string :source_id
   
    t.timestamps
    end
  end
end
