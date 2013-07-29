class Tournament < ActiveRecord::Base
    attr_accessible :name, :date, :format,
                    :bowling_center, :oil_pattern,
                    :winner, :runner_up, :top_woman, :top_senior,
                    :is_major

    #:winner, :runner_up,
    #                :top_woman, :top_senior, :num_entries,

    #validations
    #validates :name, :presence => true
    #validates :date, :presence => true
    #validates :bowling_center, :presence => true
    #validates :format, :presence => true


    #relationships
    belongs_to :bowling_center
    belongs_to :oil_pattern

    belongs_to :winner, :class_name => 'Entry'
    belongs_to :runner_up, :class_name => 'Entry'
    belongs_to :top_woman, :class_name => 'Entry'
    belongs_to :top_senior, :class_name => 'Entry'

    has_many :entries
end
