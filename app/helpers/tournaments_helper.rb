module TournamentsHelper
    def years
        %w(2013-2014 2012-2013 2011-2012 2010-2011)
    end

    def formats
        %w(Standard Match\ Play Masters Round\ Robin)
    end

    def ratio_values
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    end
    
    def lane_move_dir
      %w(None Left Right)
    end
    
    def lane_move_type
      %w(None Skip Slide)
    end
    
    def lane_move_values
      [0, 1, 2, 3, 4]
    end
end
