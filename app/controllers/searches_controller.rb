class SearchesController < ApplicationController

  def new
    @search = School.new
  end

  def create
    if @search = School.where(zip: parama[:zip])
      render @search
    else results = call_api(params[:zip])
      if results.empty?
        render :new
      else
        @search = api_create(results)
        render :show
      end
    end
  end

  def show
    @search
  end

end