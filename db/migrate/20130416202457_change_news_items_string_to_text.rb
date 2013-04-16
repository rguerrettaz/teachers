class ChangeNewsItemsStringToText < ActiveRecord::Migration
  def change
    change_table :news_items do |t|
      t.remove :tags
      t.string :source_user_url
      t.remove :caption
      t.remove :question
      t.remove :answer
    end
  end
end
