class SchoolWorker
  include Sidekiq::Worker
  include Education
  include Api

  def perform(school_id)
  	get_school_data(schoolid)
  end

end