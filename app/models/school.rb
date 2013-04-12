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

	 def api_create(query)
	  query.each do |s| School.create(:schoolid          =>  s['school']["schoolid"],
                                    :schoolname           =>  s['school']["schoolname"],              
                                    :zip                  =>  s['school']["30331"],
                                    :address              =>  s['school']["address"],
                                    :city                 =>  s['school']["city"],
                                    :districtid           =>  s['school']["districtid"],
                                    :AYPResultYear        =>  s['school']["AYPResultYear"],
                                    :distance             =>  s['school']["distance"],
                                    :enrollment           =>  s['school']["enrollment"]['total'],
                                    :gradelevel           =>  s['school']["gradelevel"],
                                    :gradesserved         =>  s['school']["gradesserved"],
                                    :latitude             =>  s['school']["latitude"],
                                    :longitude            =>  s['school']["longitude"],
                                    :phonenumber          =>  s['school']["phonenumber"],
                                    :schooldistrictname   =>  s['school']["schooldistrictname"],
                                    :schooltype           =>  s['school']["schooltype"],
                                    :state                =>  s['school']["state"],
                                    :studentteacherratio  =>  s['school']["studentteacherratio"]['total'],
                                    :website              =>  s['school']["website"],
                                    :testrating_text      =>  s['school']["testrating_text"],
                                    :testrating_year      =>  s['school']["testrating_year"])
    end
end
end