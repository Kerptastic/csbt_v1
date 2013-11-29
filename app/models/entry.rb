class Entry < ActiveRecord::Base
    attr_accessible :bowler, :tournament, :games, :is_qual_cut, :is_semi_cut,
                    :is_high_woman, :is_high_senior, :is_winner, :is_runner_up,
                    :total_matchplay_games, :total_matchplay_wins,
                    :total_stepladder_games, :total_stepladder_wins,
                    :total_pinfall, :total_games, :total_qual_games, :total_semi_games,
                    :total_qual_pinfall, :total_semi_pinfall,
                    :total_matchplay_pinfall, :total_stepladder_pinfall,
                    :highest_3_game_set, :highest_6_game_set, :highest_8_game_set

    #validations

    #relationships
    belongs_to :bowler
    belongs_to :tournament
    has_many :games

    #
    # Gets a qualifying score for the given game number.
    #
    def get_q_score(game_num)
        get_score('q', game_num)
    end

    #
    # Gets a semi-finals score for the given game number.
    #
    def get_s_score(game_num)
        get_score('se', game_num)
    end

    #
    # Gets a matchplay score for the given game number.
    #
    def get_mp_score(game_num)
        get_score('mp', game_num)
    end

    #
    # Gets a stepladder score for the given game number.
    #
    def get_sl_score(game_num)
        get_score('sl', game_num)
    end

    #
    # Gets a score for the given block and game_num values.
    # For example: block: 's' and game_num: 1 returns the
    # semifinal block game 1 score.
    #
    def get_score(block, game_num)
        if games.length != 0
            games.each do |g|
                return g.score if g.gameid.eql? "#{block}#{game_num}"
            end
            return 'DNF'
        end
    end

    #
    # Calculates the number of qualifying block games.
    #
    def calc_num_qual_games
        games.each do |g|
            self.total_qual_games += 1 if g.gameid.start_with? 'q'
        end
    end

    #
    # Calculates the number of semi-final block games.
    #
    def calc_num_semi_games
        games.each do |g|
            self.total_semi_games += 1 if g.gameid.start_with? 'se'
        end
    end

    #
    # Calculates the number of matchplay block games.
    #
    def calc_num_matchplay_games
        games.each do |g|
            self.total_matchplay_games += 1 if g.gameid.start_with? 'mp'
        end
    end

    #
    # Calculates the number of stepladder block games.
    #
    def calc_num_stepladder_games
        games.each do |g|
            self.total_stepladder_games += 1 if g.gameid.start_with? 'sl'
        end
    end

    #
    # Calculates the number of pins from the qualifying games.
    #
    def calc_total_qual_pinfall
        games.each do |g|
            self.total_qual_pinfall += g.score if g.gameid.start_with? 'q'
        end
    end

    #
    # Calculates the number of pins from the semifinal block games.
    #
    def calc_total_semi_pinfall
        games.each do |g|
            self.total_semi_pinfall += g.score if g.gameid.start_with? 'se'
        end
    end

    #
    # Calculates the number of pins from the matchplay block games.
    #
    def calc_total_matchplay_pinfall
        games.each do |g|
            self.total_matchplay_pinfall += g.score if g.gameid.start_with? 'mp'
        end
    end

    #
    # Calculates the number of pins from the stepladder block games.
    #
    def calc_total_stepladder_pinfall
        games.each do |g|
            self.total_stepladder_pinfall += g.score if g.gameid.start_with? 'sl'
        end
    end

    #
    # Calculates the average for the qualifying block.
    #
    def calc_qual_avg
        Float(self.total_qual_pinfall) / Float(self.total_qual_games)
    end

    #
    # Calculates the average for the semifinal block.
    #
    def calc_semi_avg
        Float(self.total_semi_pinfall) / Float(self.total_semi_games)
    end

    #
    # Calculates the average for the qualifying and semifinal blocks together.
    #
    def calc_qual_semis_avg
        Float(calc_qual_semis_total_pinfall) / Float(self.total_qual_games + self.total_semi_games)
    end

    #
    # Calculates the average for the match play block.
    #
    def calc_matchplay_avg
        Float(self.total_matchplay_pinfall) / Float(self.total_matchplay_games)
    end

    #
    # Calculates the average for the step ladder block.
    #
    def calc_stepladder_avg
        Float(self.total_stepladder_pinfall) / Float(self.total_stepladder_games)
    end


    #
    # Gets the plus/minus value for the qualifying block.
    #
    def qual_plus_minus
        plusminus = self.total_qual_pinfall - (total_qual_games * 200)

        if plusminus > 0
            result = "+#{plusminus}"
        elsif plusminus == 0
            result = 'E'
        else
            result = plusminus
        end

        result
    end

    #
    # Gets the plus/minus value for the qualifying and the semifinal blocks together.
    #
    def qual_semis_plus_minus
        plusminus = calc_qual_semis_total_pinfall -
            ((self.total_qual_games + self.total_semi_games) * 200)

        if plusminus > 0
            result = "+#{plusminus}"
        elsif plusminus == 0
            result = 'E'
        else
            result = plusminus
        end

        result
    end


    #
    # Calculates the total pin fall for the qualifying and semifinal blocks today.
    #
    def calc_qual_semis_total_pinfall
        self.total_qual_pinfall + self.total_semi_pinfall
    end


    #
    # Calculates the total pin fall for this entry.
    #
    def calc_total_pinfall
        self.total_pinfall = games.map(:+)
    end

    #
    # Calculates the total games bowled for this entry.
    #
    def calc_total_games
        self.total_games = self.total_qual_games + self.total_semi_games +
            self.total_matchplay_games + self.total_stepladder_games
    end

    #
    # Calculates the highest 3 game set for this entry.
    #
    def calc_highest_3_games
        #best_total = 0
        #current_total = 0
        #
        #games.each_slice(3) do |triplet|
        #    triplet.each do |g|
        #        current_total += g.score
        #    end
        #
        #    if current_total > best_total
        #        best_total = current_total
        #    end
        #
        #    current_total = 0
        #end
        #
        #self.highest_3_game_set = best_total
    end

    #
    # Calculates the highest 6 game set for this entry.
    #
    def calc_highest_6_games
        #best_total = 0
        #current_total = 0
        #
        #games.each_slice(6) do |triplet|
        #    triplet.each do |g|
        #        current_total += g.score
        #    end
        #
        #    if current_total > best_total
        #        best_total = current_total
        #    end
        #
        #    current_total = 0
        #end
        #
        #self.highest_6_game_set = best_total
    end

    #
    # Calculates the highest 8 game set for this entry.
    #
    def calc_highest_8_games
        #best_total = 0
        #current_total = 0
        #
        #games.each_slice(8) do |triplet|
        #    triplet.each do |g|
        #        current_total += g.score
        #    end
        #
        #    if current_total > best_total
        #        best_total = current_total
        #    end
        #
        #    current_total = 0
        #end
        #
        #self.highest_8_game_set = best_total
    end



    #
    #
    #
    def is_in_semis
        true if self.total_semi_games > 0
    end

    #
    #
    #
    def is_in_stepladder
        true if self.total_stepladder_games > 0
    end
end
