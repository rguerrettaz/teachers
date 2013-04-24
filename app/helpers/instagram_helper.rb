module InstagramHelper
  include ApplicationHelper

  
  # Finds a school by coordinates and school name. Fires off a search to images
  # to our good friend images_by_loc with the Instagram location ID.
  #
  # If a matching Instagram ID can't be found, or if there aren't any recent
  # Instagram photos at that location, it hands the search off to
  # images_by_coords with the lat and long.
  #
  # This could be split into a couple methods, I think.
  def find_by_coords(lat, lng, school_name)
    @id = nil

    begin
      p locations = Instagram.location_search(lat, lng)
    rescue
      puts "***** ERROR. Probably a 500. *****"
      return
    end

    unless locations == nil
      locations.each do |loc|
        distance = (Levenshtein.normalized_distance(loc.name, school_name) * 100)
        unless distance < 25
        else
          @id = loc.id
          images_by_loc(@id)
        end
      end
    end

    if @id == nil
      @location_images = nil
      puts "***** NO IMAGES FOUND BY LOCATION *****"
    end
  end

  # Returns recent Instagram objects from the place with the included Instagram
  # ID.
  def images_by_loc(loc)
    @location_images = Instagram.location_recent_media(loc, :count => 10)
    puts "***** #{@location_images.length} images found by location"
  end

  # This is the backup plan for find_by_coords. If no images can be found by
  # a location's Instagram ID (or if there's no matching Instagram ID), this
  # method searches for images within 100 meters of the geo coordinates.
  # def images_by_coords(lat, lng)
  #   @location_images = Instagram.media_search(lat, lng, :count => 10,
  #                                                       :distance => 100)
  #   puts "***** #{@location_images.length} images found by coordinates"
  # end

  # Breaks down an Instagram object into easy components for the view.
  def image_url(object)
    @url               = object.images.standard_resolution.url
    unless object.caption.nil?
      @profile_picture = object.caption.from.profile_picture
      @username        = object.caption.from.username
      @caption         = object.caption.text.html_safe
    end
  end
end
