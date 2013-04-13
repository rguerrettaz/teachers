module InstagramHelper
  include ApplicationHelper

  def insta_search

    posts = TAGS.map do |tag|
      Instagram.tag_recent_media(tag, :limit => TAG_SEARCH)
    end
    posts.flatten!
  end

  def from_insta
    insta_search.map do |pic|
      NewsItem.new(:published_at => pic.created_time,
                    :source => 'Instagram',
                    :source_user => pic.caption.from.username,
                    :source_url => "http://instagram.com/" + pic.caption.from.username,
                    :type => 'photo',
                    :tags => pic.tags,
                    :popularity => popularity((pic.comments.count + pic.likes.count), pic.caption.created_time.to_i ),
                    :body => pic.caption.text,
                    :photo_urls => pic.images.standard_resolution.url
                  )
    end

  end



  def find_by_coords(lat, lng, school_name)
    @id = nil
    locations = Instagram.location_search(lat, lng)

    locations.each do |loc|
      distance = (Levenshtein.normalized_distance(loc.name, school_name) * 100)
      unless distance < 25
        puts "Nope! It's #{loc.id}, #{loc.name}!"
      else
        puts "Yep! It's #{loc.id}, #{loc.name}!"
        @id = loc.id
        images_by_loc(@id)
      end
    end

    puts "\n***** @id is #{@id}"

    if @id == nil
      puts "***** LOCATION NOT FOUND *****"
      puts "*****  TIME FOR PLAN B   *****"
      images_by_coords(lat, lng)
    end
  end

  def images_by_loc(loc)
    @location_images = Instagram.location_recent_media(loc, :count => 10)
    puts "***** #{@location_images.length} images found by location"
  end

  def images_by_coords(lat, lng)
    @location_images = Instagram.media_search(lat, lng, :count => 10, :distance => 100)
    puts "***** #{@location_images.length} images found by coordinates"
  end

  def image_url(object)
    @url             = object.images.standard_resolution.url
    unless object.caption.nil?
      @profile_picture = object.caption.from.profile_picture
      @username        = object.caption.from.username
      @caption         = object.caption.text.html_safe
    end
  end



end
