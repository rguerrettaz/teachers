class SchoolWorker
  include Sidekiq::Worker
  include Education
  include Api

  def perform(schoolid)
  	get_school_data(schoolid)
  end

end
