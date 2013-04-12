class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string  :headline
      t.string  :author
      t.string  :url
      t.text    :body
      t.integer :stars
      t.string  :date_published
      t.text    :location
      t.string  :avatar_url

      t.timestamps
    end
  end
end
