# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'
require 'open-uri'


alaska = JSON.parse(open("http://api.education.com/service/service.php?resf=json&f=schoolSearch&key=f1adcc65e4df0852db7a09d0f84e2167&sn=sf&v=4&state=ak").read)


alaska.each do |s| School.create( 	:schoolid             =>  s['school']["schoolid"],
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