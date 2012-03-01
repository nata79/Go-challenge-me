class HomeController < ApplicationController

  def index
    if Dispute.count > 0
      # Get featured video
      @max_votes = Dispute.maximum('votes')
      @disputeFeatured = Dispute.find_all_by_votes(@max_votes).first
      @bestScore = @disputeFeatured.videos.maximum('number') if @disputeFeatured.record == 0
      @bestScore = @disputeFeatured.videos.minimum('number') if @disputeFeatured.record == 1
      @featured = @disputeFeatured.videos.find_all_by_number(@bestScore).first
    end
  end

end
