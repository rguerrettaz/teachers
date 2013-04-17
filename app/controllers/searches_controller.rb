class SearchesController < ApplicationController

	def new
		@skip_header_search = true
		@school = School.new	
	end

end