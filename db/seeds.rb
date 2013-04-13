# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'json'
# require 'open-uri'


School.create(:schoolid          =>  '',
                                        :schoolname           =>  'Dev Bootcamp',              
                                        :zip                  =>  '94108',
                                        :address              =>  '717 California St #200',
                                        :city                 =>  'san francisco',
                                        :districtid           =>  '',
                                        :AYPResultYear        =>  '',
                                        :distance             =>  '',
                                        :enrollment           =>  '50',
                                        :gradelevel           =>  '',
                                        :gradesserved         =>  '',
                                        :latitude             =>  '37.79221',
                                        :longitude            =>  '-122.40614',
                                        :phonenumber          =>  '(415) 295-2668',
                                        :schooldistrictname   =>  '',
                                        :schooltype           =>  '',
                                        :state                =>  'CA',
                                        :studentteacherratio  =>  '7',
                                        :website              =>  'http://www.devbootcamp.com',
                                        :testrating_text      =>  '5',
                                        :testrating_year      =>  '2013')





