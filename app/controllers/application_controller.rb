class ApplicationController < ActionController::Base
  protect_from_forgery

  def call_api(zip)
    query = JSON.parse(open("http://api.education.com/service/service.php?resf=json&f=schoolSearch&key=f1adcc65e4df0852db7a09d0f84e2167&sn=sf&v=4&zip=#{zip}").read)
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
