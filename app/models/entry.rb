class Entry < ActiveRecord::Base
  attr_accessible :bowler, :tournament

  #validations
  validates_associated :tournament
  validates_associated :bowler

  #associations
  belongs_to :tournament
  belongs_to :bowler
end
