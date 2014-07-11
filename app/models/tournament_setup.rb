class TournamentSetup < ActiveRecord::Base
    attr_accessible :starting_lane, :num_lanes, :left_move_type, :right_move_type,
                    :left_move_dir, :right_move_dir, :left_move_amt, :right_move_amt 
end
