class Dispute < ActiveRecord::Base
  has_many :videos

  validates :description, :presence => true,  :length => { :minimum => 40 }
  validates :record,      :presence => true
end
