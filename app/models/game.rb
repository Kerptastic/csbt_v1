class Game < ActiveRecord::Base
    attr_accessible :score, :gameid, :entry

    #validations
    validates :score, :presence => true
    validates :gameid, :presence => true

    #associations
    belongs_to :entry
end
