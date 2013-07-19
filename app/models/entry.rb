class Entry < ActiveRecord::Base
    attr_accessible :bowler, :tournament, :games, :is_qual_cut, :is_semi_cut,
                    :is_high_woman, :is_high_senior, :is_winner, :is_runner_up

    #validations

    #relationships
    belongs_to :bowler
    belongs_to :tournament
    has_many :games

    #method
    def get_q_score(game_num)
        get_score('q', game_num)
    end

    def get_s_score(game_num)
        get_score('s', game_num)
    end

    def get_f_score(game_num)
        get_score('f', game_num)
    end

    def get_score(block, game_num)
        if games.length != 0
            games.where('gameid = ?', "#{block}#{game_num}").first.score
        end
    end




    def is_in_semis
        if games.length != 0
            !games.where('gameid like ?', 's%').empty?
        end
    end


    def is_in_finals
        if games.length != 0
            !games.where('gameid like ?', 'f%').empty?
        end
    end











    def qual_block_total
        if games.empty?
            '-'
        else
            games.where('gameid like ?', 'q%').sum(&:score)
        end
    end


    def num_qual_block_games
        games.where('gameid like ?', 'q%').count
    end


    def qual_block_avg
        if games.empty?
            '-'
        else
            qual_block_total / num_qual_block_games
        end
    end


    def qual_block_plus_minus
        if games.empty?
            '-'
        else
            pm = qual_block_total - (num_qual_block_games * 200)

            if pm > 0
                "+#{pm}"
            else
                pm
            end
        end
    end



    def num_semi_block_games
        games.where('gameid like ?', 's%').count
    end



    def semi_block_total
        if games.empty?
            '-'
        else
            games.where('gameid like ?', 's%').sum(&:score)
        end
    end








    def qual_plus_semis_total
        if games.empty?
            '-'
        else
           qual_block_total + semi_block_total
        end
    end

    def qual_plus_semis_avg
        qual_plus_semis_total  / (num_qual_block_games + num_semi_block_games)
    end

    def qual_plus_semis_plus_minus
        if games.empty?
            '-'
        else
            pm = qual_plus_semis_total - ((num_qual_block_games + num_semi_block_games) * 200)

            if pm > 0
                "+#{pm}"
            else
                pm
            end
        end
    end
end
