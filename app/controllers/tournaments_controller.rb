class TournamentsController < ApplicationController

    def index
        @tournaments = Tournament.all

        #@tournaments.each do |t|
        #    puts t.name + "\n"
        #end
    end

    def show
        @tourney = Tournament.where(:id => params[:id]).first
    end

end
