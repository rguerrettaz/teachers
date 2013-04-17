class SchoolsController < ApplicationController
	
	def create
		@school = School.new
	end

	def show
		@school = School.find(params[:id])
	end

	def search
		# if params[:zip].blank? && params[:city].blank?
		@schools = School.find_or_call(params[:zip], params[:state], params[:city])
		if params[:header] == 'true'
		  @skip_header_search = true
			render 'searches/new'
		else	
			render :json => @schools.to_json
		end
	end
end
