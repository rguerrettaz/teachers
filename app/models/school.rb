class School < ActiveRecord::Base
	include Api	

  attr_accessible :schoolid, :schoolname, :zip, :address, :city, :districtid, :AYPResultYear, :distance, :enrollment  , :gradelevel, :gradesserved, :latitude, :longitude, :phonenumber, :schooldistrictname, :schooltype, :state, :studentteacherratio , :website, :testrating_text, :testrating_year

	 def self.find_or_call(zip, state)
   	 @schools = School.where(zip: zip, state: state)
		 if @schools.empty?
			 School.call_api(zip,state)	
		   @schools = School.where(zip: zip, state: state)
		 end
		 return @schools	
	 end

end