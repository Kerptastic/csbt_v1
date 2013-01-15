class Game < ActiveRecord::Base
  attr_accessible :score, :number, :bowler, :tournament

  #validations
  validates :score,  :presence => true, :length => { :is => 3 }
  validates :number, :presence => true
  validates_associated :bowler
  validates_associated :tournament

  #associations
  belongs_to :bowler
  belongs_to :tournament
end
