require 'json'
require 'open-uri'

module Api
  module ClassMethods  
      def call_api(zip,state,city) 
        p "I'm in the API!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        if zip.blank? && city.blank?
            query = JSON.parse(open("http://api.education.com/service/service.php?resf=json&f=schoolSearch&key=410e1967497cd724f524a35879ffc078&sn=sf&v=4&state=#{state}").read)
        elsif zip.blank?
            query = JSON.parse(open("http://api.education.com/service/service.php?resf=json&f=schoolSearch&key=410e1967497cd724f524a35879ffc078&sn=sf&v=4&state=#{state}&city=#{URI::encode(city).downcase}").read)
        elsif city.blank?
            query = JSON.parse(open("http://api.education.com/service/service.php?resf=json&f=schoolSearch&key=410e1967497cd724f524a35879ffc078&sn=sf&v=4&state=#{state}&zip=#{zip.to_i}").read)
        else 
            query = JSON.parse(open("http://api.education.com/service/service.php?resf=json&f=schoolSearch&key=410e1967497cd724f524a35879ffc078&sn=sf&v=4&state=#{state}&zip=#{zip.to_i}&city=#{URI::encode(city).downcase}").read)
        end
        query.each do |s| School.create(:schoolid          =>  s['school']["schoolid"],
                                        :schoolname           =>  s['school']["schoolname"],              
                                        :zip                  =>  s['school']["zip"],
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

  def self.included(receiver)
    receiver.extend ClassMethods
  end

end