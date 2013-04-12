class SchoolsController < ApplicationController

	def create
		@school = School.new
	end

	def show
		@school = School.new

	end

	def search
		@schools = School.where(params[:zip])
		# if @schools
		# 	redire	ct @school
		# else
		# end
	end


	def index
	  @search = School.where(params[:zip])
  	@products = @search.all
	end


		end

	end

end
