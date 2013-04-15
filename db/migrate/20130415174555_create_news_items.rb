class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string  :popularity
      t.string  :source
      t.integer :source_id
      t.references :comment

      t.timestamps
    end
  end
end
