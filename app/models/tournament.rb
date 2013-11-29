class Tournament < ActiveRecord::Base
    attr_accessible :name, :date, :format,
                    :bowling_center, :oil_pattern,
                    :winner, :runner_up, :top_woman, :top_senior,
                    :is_major, :cash_ratio_value
    #relationships
    belongs_to :bowling_center
    belongs_to :oil_pattern
    belongs_to :winner, :class_name => 'Entry'
    belongs_to :runner_up, :class_name => 'Entry'
    belongs_to :top_woman, :class_name => 'Entry'
    belongs_to :top_senior, :class_name => 'Entry'

    has_many :entries

    before_save :update_records

    def update_records
      puts 'updating record data'
    end


    def set_date_to_now
        self.date = DateTime.now.to_date
    end
end
