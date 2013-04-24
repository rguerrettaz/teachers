require 'nokogiri'
require 'open-uri'

module GreatSchools

  def self.call_great_schools_api(state,city)
    results = Nokogiri::XML(open("http://api.greatschools.org/schools/#{state}/#{URI::encode(city).downcase}?key=jwow10lnlznasqr26iwv1wxx"))
    schools = results.xpath('//schools/school')

    schools.each do |school|
      School.create(parse_result_to_school_attrs(school))
    end
  end

  def self.parse_result_to_school_attrs(school)
    school_attrs = {
      :schoolname => school.xpath('name').text,
      :nces_id => school.xpath('ncesId').text,
      :schoolid =>  school.xpath('gsId').text,
      :city => school.xpath('city').text,
      :address => school.xpath('address').text,
      :districtid => school.xpath('name').text,
      :gradesserved => school.xpath('gradeRange').text,
      :latitude => school.xpath('lat').text,
      :longitude => school.xpath('lon').text,
      :phonenumber => school.xpath('phone').text,
      :schooldistrictname => school.xpath('district').text,
      :schooltype => school.xpath('type').text,
      :state => school.xpath('state').text,
      :website => school.xpath('website').text,
      :enrollment  => (school.xpath('enrollment').text).to_i
     }
  end
end
