class SearchesController < ApplicationController

  def new
    @school = School.new
  end
end