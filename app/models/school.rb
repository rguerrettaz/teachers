class School < ActiveRecord::Base
 attr_accessible	 :schoolid
	 attr_accessible		:schoolname
	 attr_accessible		:zip
	 attr_accessible		:address
	 attr_accessible		:city
	 attr_accessible		:districtid
	 attr_accessible		:AYPResultYear
	 attr_accessible		:distance
	 attr_accessible		:enrollment  
	 attr_accessible		:gradelevel
	 attr_accessible		:gradesserved
	 attr_accessible		:latitude
	 attr_accessible		:longitude
	 attr_accessible		:phonenumber
	 attr_accessible		:schooldistrictname
	 attr_accessible		:schooltype
	 attr_accessible		:state
	 attr_accessible		:studentteacherratio 
	 attr_accessible		:website
	 attr_accessible		:testrating_text
	 attr_accessible		:testrating_year
end
