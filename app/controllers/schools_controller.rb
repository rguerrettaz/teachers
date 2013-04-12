class SchoolsController < ApplicationController
	
	def create
		@school = School.new
	end

	def show
		@school = School.find(params[:id])
	end

	def search
		@schools = School.where(zip: params[:zip], state: params[:state])
		if @schools.empty?
			call_api(params[:zip],params[:state])	
		  @schools = School.where(zip: params[:zip], state: params[:state])
		end	
			render :json => @schools.to_json
	end
end
