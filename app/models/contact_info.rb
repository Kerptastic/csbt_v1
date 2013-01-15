class ContactInfo < ActiveRecord::Base
  attr_accessible :street, :city, :state, :zip

  #validations
  validates :street, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true, :length => { :is => 2 }
  validates :zip, :presence => true, :length => { :is => 5 },
            :numericality => { :only_integer => true }

  #relationships
  has_one :bowler
end
