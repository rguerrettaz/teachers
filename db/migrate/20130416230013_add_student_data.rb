class AddStudentData < ActiveRecord::Migration
  def change
    change_table :news_items do |col|
      col.integer :white
      col.integer :hispanic
      col.integer :black
      col.integer :asian
      col.integer :native_american
      col.integer :male
      col.integer :female
      col.integer :free_lunch
      col.integer :ell
      col.integer :dropout
      col.integer :total_enrolled

    end
  end
end
