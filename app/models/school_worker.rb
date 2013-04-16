class SchoolWorker
  include Sidekiq::Worker

  def perform(school_id)
  	  #call to api school populate goes here
  end

end