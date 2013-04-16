class StringToText < ActiveRecord::Migration
  def change
    change_table :news_items do |t|
      t.text :caption
      t.text :question
      t.text :answer
    end
  end
end
