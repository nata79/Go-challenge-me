class Video < ActiveRecord::Base
  belongs_to :dispute

  validates :number,        :presence => true
  validates :youtube_id,    :presence => true
end
