module InstagramHelper

  def image_url(object)
    @url             = object.images.standard_resolution.url
    @profile_picture = object.caption.from.profile_picture
    @full_name       = object.caption.from.full_name
    @username        = object.caption.from.username
    @caption         = object.caption.text.html_safe
  end

  def find_by_coords(lat, lng, school_name)
    locations = Instagram.location_search(lat, lng)

    locations.each do |loc|
      distance = (Levenshtein.normalized_distance(loc.name, school_name) * 100)
      unless distance < 25
        puts "Nope!"
      else
        puts "Yep! It's #{loc.id}, #{loc.name}!"
        @id = loc.id
        images_by_loc(@id)
      end
    end
  end

  def images_by_loc(loc)
    @location_images = Instagram.location_recent_media(loc)
  end

end
