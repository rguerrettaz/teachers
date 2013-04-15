module ApplicationHelper

  TAG_SEARCH = 5
  TAGS = ['education', 'edchat']


  def popularity(vote, created_at)
    created_at = created_at.to_time.to_i unless created_at.class == Fixnum

    hours = ((Time.now.to_i - created_at) / 60) / 60
    popularity = (((vote.to_i - 1) / ((hours + 2) ** 1.5))*10).ceil
  end


end
