module EducationHelper
#   include ApplicationHelper

# 		def call_education(schoolid) 
#         school_data = JSON.parse(open("http://api.education.com/service/service.php?resf=json&f=getStudentStats&key=410e1967497cd724f524a35879ffc078&sn=sf&v=4&schoolid=#{schoolid.to_i}").read)
#         end
#           p "I'm in the API!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
#           p school_data
# 	        school = School.find_by_schoolid(schoolid)
#           school.update_attributes(
#                                         # :schoolname           =>  s['school']["schoolname"],              
#                                         # :zip                  =>  s['school']["zip"],
#                                         # :address              =>  s['school']["address"],
#                                         # :city                 =>  s['school']["city"].downcase,
#                                         # :districtid           =>  s['school']["districtid"],
#                                         # :AYPResultYear        =>  s['school']["AYPResultYear"],
#                                         # :distance             =>  s['school']["distance"],
#                                         # :enrollment           =>  s['school']["enrollment"]['total'],
#                                         # :gradelevel           =>  s['school']["gradelevel"],
#                                         # :gradesserved         =>  s['school']["gradesserved"],
#                                         # :latitude             =>  s['school']["latitude"],
#                                         # :longitude            =>  s['school']["longitude"],
#                                         # :phonenumber          =>  s['school']["phonenumber"],
#                                         # :schooldistrictname   =>  s['school']["schooldistrictname"],
#                                         # :schooltype           =>  s['school']["schooltype"],
#                                         # :state                =>  s['school']["state"],
#                                         # :studentteacherratio  =>  s['school']["studentteacherratio"]['total'],
#                                         # :website              =>  s['school']["website"],
#                                         # :testrating_text      =>  s['school']["testrating_text"],
#                                         # :testrating_year      =>  s['school']["testrating_year"]
#                                         # :white 

#                                         )
#           end
# end

# {"school":[{"stat_type":"Student Ethnicity","data":[{"stat_name":"White","year":2011,"percentage":58,"total":1071},{"stat_name":"Asian\/Pacific Islander","year":2011,"percentage":23,"total":428},{"stat_name":"Hispanic","year":2011,"percentage":9,"total":161},{"stat_name":"Two or More Races","year":2011,"percentage":7,"total":124},{"stat_name":"Black","year":2011,"percentage":4,"total":66},{"stat_name":"American Indian\/Alaskan Native","year":2011,"percentage":0,"total":2}]},{"stat_type":"Student Gender","data":[{"stat_name":"Female","year":2011,"percentage":50,"total":932},{"stat_name":"Male","year":2011,"percentage":50,"total":920}]},{"stat_type":"Student Economic Level","data":[{"stat_name":"Students Eligible for Free or Reduced-Price Lunch","year":2011,"percentage":6,"total":118}]},{"stat_type":"Student Subgroups","data":[{"stat_name":"English Language Learners","year":2008,"percentage":2,"total":30}]},{"stat_type":"Student Completion","data":[{"stat_name":"Annual Dropout Rate for Grades 9-12","year":2006,"percentage":0,"total":8}]},{"stat_type":"Student Enrollment","data":[{"stat_name":"Total Enrollment","year":2011,"percentage":0,"total":1852}]}],"city":[]}

# ethnic = school_data["school"].select {|stat| stat["stat_type"] == "Student Ethnicity" }
# gender = school_data["school"].select {|stat| stat["stat_type"] == "Student Gender"}
# lunch = school_data["school"].select {|stat| stat["stat_type"] == "Student Completion" }
# completion = school_data["school"].select {|stat| stat["stat_type"] == "Student Completion"}

# :white = ethnic['data'].select {|stat| stat['stat_name'] == 'White'}.select {|stat| stat['stat_name'] == 'White'}.percentage.to_s
end