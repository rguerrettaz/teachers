class School < ActiveRecord::Base
	include Api	
	after_create :populate_student_data
  attr_accessible :schoolid, :schoolname, :zip, :address, :city, :districtid, :AYPResultYear, :distance, :enrollment, :gradelevel, :gradesserved, :latitude, :longitude, :phonenumber, :schooldistrictname, :schooltype, :state, :studentteacherratio , :website, :testrating_text, :testrating_year


	 def self.find_or_call(zip, state, city)
	 	 params = {}
   	 params[:state] = state
   	 params[:zip] = zip unless zip.blank?
   	 params[:city] = city.downcase unless city.blank?
   	 @schools = School.find(:all, :conditions => params)
		 if @schools.empty?
			 School.call_api(zip,state,city)	
 			 @schools = School.find(:all, :conditions => params)
 		 end
		 return @schools	
	 end

	 private

	 def populate_student_data
     get_school_data(self.schoolid)
		 # SchoolWorker.perform_async(self.id)	
	 end
	 
end
