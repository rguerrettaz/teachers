class AddNcesidToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :nces_id, :string
  end
end
