module RecordsHelper
    def categories
        {
            choose: %w(Choose\ a\ category...),
            scoring: %w(Scoring\ Records),
            career: %w(Career\ Records),
            season: %w(Single\ Season\ Records),
            achievements: %w(Achievements)
        }
    end
end
