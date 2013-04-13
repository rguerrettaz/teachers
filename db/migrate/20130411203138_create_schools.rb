class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|

		  t.string    :schoolid
			t.string    :schoolname
			t.string    :zip
			t.string    :address
			t.string    :city
			t.string    :districtid
			t.string    :AYPResultYear
			t.string    :distance
			t.string    :enrollment  
			t.string    :gradelevel
			t.string    :gradesserved
			t.string    :latitude
			t.string    :longitude
			t.string    :phonenumber
			t.string    :schooldistrictname
			t.string    :schooltype
			t.string    :state
			t.string    :studentteacherratio 
			t.string    :website
			t.string    :testrating_text
			t.string    :testrating_year
	
      t.timestamps
    end
  end
end
