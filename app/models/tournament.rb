class Tournament < ActiveRecord::Base
  attr_accessible :name, :date, :bowling_center, :format

  #validations
  validates :name,            :presence => true
  validates :date,            :presence => true
  validates :bowling_center,  :presence => true
  validates :format,          :presence => true

  #relationships
  has_many :bowler, :through => :entries
end
