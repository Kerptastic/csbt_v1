class Entry < ActiveRecord::Base
    attr_accessible :bowler, :tournament, :games, :is_qual_cut, :is_semi_cut,
                    :is_high_woman, :is_high_senior

    #validations

    #relationships
    belongs_to :bowler
    belongs_to :tournament
    has_many :games

    #methods
    def q1score
        if games.empty?
            '-'
        else
            games.where(:gameid => 'q1').first.score
        end
    end

    def q2score
        if games.empty?
            '-'
        else
            games.where(:gameid => 'q2').first.score
        end
    end

    def q3score
        if games.empty?
            '-'
        else

            games.where(:gameid => 'q3').first.score
        end
    end

    def q4score
        if games.empty?
            '-'
        else
            games.where(:gameid => 'q4').first.score
        end
    end

    def q5score
        if games.empty?
            '-'
        else
            games.where(:gameid => 'q5').first.score
        end
    end

    def q6score
        if games.empty?
            '-'
        else
            games.where(:gameid => 'q6').first.score
        end
    end

    def s1score
        if games
        .empty?
            '-'
        else
            games.where(:gameid => 's1').first.score
        end
    end

    def s2score
        if games.empty?
            '-'
        else
            games.where(:gameid => 's2').first.score
        end
    end

    def s3score
        if games.empty?
            '-'
        else
            games.where(:gameid => 's3').first.score
        end
    end

    def qual_block_total
        if games.empty?
            '-'
        else
            games.where('gameid like ?', 'q%').all.sum(&:score)
        end
    end

    def qual_block_plus_minus
        if games.empty?
            '-'
        else
            pm = games.where('gameid like ?', 'q%').all.sum(&:score) - (games.where('gameid like ?', 'q%').count * 200)

            if pm > 0
                pm = "+#{pm}"
            else
                pm
            end
        end
    end

    def qual_block_avg
        if games.empty?
            '-'
        else
            games.where('gameid like ?', 'q%').all.sum(&:score) / games.where('gameid like ?', 'q%').count
        end
    end

    def semi_block_total
        if games.empty?
            '-'
        else
            games.where('gameid like ?', 's%').all.sum(&:score)
        end
    end
end
