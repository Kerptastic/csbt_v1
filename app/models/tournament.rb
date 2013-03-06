class Tournament < ActiveRecord::Base
    attr_accessible :name, :date, :format, :winner, :runner_up,
                    :top_woman, :top_senior, :num_entries, :oil_pattern, :bowling_center

    #validations
    validates :name, :presence => true
    validates :date, :presence => true
    validates :bowling_center, :presence => true
    validates :format, :presence => true


    #relationships
    belongs_to :winner, :foreign_key => "winner_id", :class_name => "Bowler"
    belongs_to :runner_up, :foreign_key => "runner_up_id", :class_name => "Bowler"
    belongs_to :top_woman, :foreign_key => "top_woman_id", :class_name => "Bowler"
    belongs_to :top_senior, :foreign_key => "top_senior_id", :class_name => "Bowler"
    belongs_to :bowling_center, :foreign_key => "bowling_center_id", :class_name => "BowlingCenter"
    belongs_to :oil_pattern, :foreign_key => "oil_pattern_id", :class_name => "OilPattern"
end
