require 'json'
require 'open-uri'

module School
  module ClassMethods 

    def get_school_data(schoolid)
      data = prepare_school_data(call_education(schoolid))
	    school = School.find_by_schoolid(schoolid)

      school.update_attributes( :white => data['white'].to_i,
                                  :hispanic => data['hispanic'].to_i,
                                  :black => data['black'].to_i, 
                                  :asian => data['asian'].to_i,
                                  :native_american => data['native_american'].to_i,
                                  :male => data['male'].to_i,
                                  :female => data['female'],
                                  :free_lunch => data['free_lunch'].to_i,
                                  :ell => data['white'].to_i,
                                  :dropout => data['white'].to_i,
                                  :total_enrolled => data['total_enrolled'].to_i)
    end

    private

    def call_education(schoolid)
        school_data = JSON.parse(open("http://api.education.com/service/service.php?resf=json&f=getStudentStats&key=410e1967497cd724f524a35879ffc078&sn=sf&v=4&schoolid=#{schoolid.to_i}").read)
        school_data['school']
    end

    def prepare_school_data(data)
      stat = Hash.new
      data.each do |type|
        type['data'].map do |field|         
          stat['white'] = field['percentage'] if field['stat_name'] == 'White'
          stat['hispanic'] = field['percentage'] if field['stat_name'] == 'Hispanic'
          stat['black'] = field['percentage'] if field['stat_name'] == 'Black'
          stat['asian'] = field['percentage'] if field['stat_name'] == 'Asian/Pacific Islander'
          stat['native_american'] = field['percentage'] if field['stat_name'] == 'American Indian/Alaskan Native'
          stat['male'] = field['percentage'] if field['stat_name'] == 'Female'
          stat['female'] = field['percentage'] if field['stat_name'] == 'Male'
          stat['free_lunch'] = field['percentage'] if field['stat_name'] == 'Students Eligible for Free or Reduced-Price Lunch'
          stat['total_enrolled'] = field['percentage'] if field['stat_name'] == 'Total Enrollment'

        end
      end
      stat
    end 

  end
end
