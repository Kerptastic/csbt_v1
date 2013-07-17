class TournamentsController < ApplicationController

    def index
        @tournaments

        if params[:season].nil?

            @tournaments = Tournament.where('date >= \'2012-08-01\' && date <= ?', '%d-08-01' %  Date.today.year).reverse_order
        else
            #parse out the season value
            year = params[:season][0...4]
            beforeDate = year + '-08-01'

            nextYear = year.to_i + 1

            afterDate = '%d-08-01' % [nextYear]

            @tournaments = Tournament.where('date >= ? && date <= ?', beforeDate, afterDate).reverse_order
        end

        respond_to do |format|
            format.html { puts 'type = html' }
            format.js { puts 'type = js' }
        end
    end


    def show
        @tourney = Tournament.where(:id => params[:id]).first
    end

end
