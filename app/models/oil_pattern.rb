class OilPattern < ActiveRecord::Base
    attr_accessible :name, :url

    #validations
    validates :name, :presence => true
    validates :url, :presence => true

    #relationships
    has_many :tournament
end
