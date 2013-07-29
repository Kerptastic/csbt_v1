class TournamentsController < ApplicationController

    def index
        @tournaments

        if params[:index].nil?

            @tournaments = Tournament.
                where('date >= \'2012-08-01\' && date <= ?', '%d-08-01' %  Date.today.year).
                includes(:bowling_center, :oil_pattern,
                         { winner: [:bowler] }, { runner_up: [:bowler] },
                         { top_woman: [:bowler] }, { top_senior: [:bowler] }).reverse_order
        else
            #parse out the index value
            year = params[:index][0...4]
            beforeDate = year + '-08-01'

            nextYear = year.to_i + 1

            afterDate = '%d-08-01' % [nextYear]

            @tournaments = Tournament.
                where('date >= ? && date <= ?', beforeDate, afterDate).
                includes(:bowling_center, :oil_pattern,
                         { winner: [:bowler] }, { runner_up: [:bowler] },
                         { top_woman: [:bowler] }, { top_senior: [:bowler] }).reverse_order
        end

        respond_to do |format|
            format.html
            format.js
        end
    end


    def show
        @tourney = Tournament.includes(entries: [:bowler, :games]).find(params[:id])
    end

end
