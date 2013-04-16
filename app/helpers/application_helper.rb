module ApplicationHelper

  TAG_SEARCH = 5
  TAGS = ['education', 'edchat']


  def calculate_popularity(vote, created_at)
    if created_at.class == String
      created_at = created_at.to_time.utc
    else
      created_at = Time.at(created_at.to_i).utc
    end

    time = Time.now - created_at

    hours = ((time.to_i) / 60) / 60

    (((vote.to_i - 1) / ((hours + 2) ** 1.5))*10).round
  end


end
