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
		render :json => @schools.to_json
	end
end
