class NewsItemsController < ApplicationController

  def index
    # @location_recent_media = Instagram.location_recent_media(82197239)
    # search = [from_tumblr, from_twitter, from_insta, from_reddit].flatten!
    # @news_items = search.sort_by { |item| item.popularity }.reverse!
    respond_to do |format|
      format.html
      format.json do
        search = [from_tumblr, from_twitter, from_insta, from_reddit].flatten!
        @news_items = search.sort_by { |item| item.popularity }.reverse!
        render :json => render_to_string(:partial => 'news_items', :locals => {:news_items => @news_items}).to_json
      end
    end
  end

  def test
    # @search = [tumblr_search, twitter_search, insta_search, reddit_education]
    # search = [from_tumblr, from_twitter, from_insta, from_reddit].flatten!
    # @news_items = search.sort_by { |item| item.popularity }.reverse!
  end

  def show
    @news_item = news_item.find(params[:id])
  end

  def load
    render 'layouts/loader'
  end

end
