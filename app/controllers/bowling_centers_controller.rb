class BowlingCentersController < ApplicationController
  
    def index
        @bowling_centers = BowlingCenter.all.sort { |a, b| a.id <=> b.id }

        respond_to do |format|
            format.js { render :json => @bowling_centers }
        end
    end

    def create
        @new_center = BowlingCenter.new(params[:bowling_center])

        @saved = @new_center.save
    end

    def update
        updated = params[:bowling_center]

        @updated_center = BowlingCenter.find(updated[:id])

        @updated_center.name = updated[:name]
        @updated_center.url = updated[:url]

        @saved = @updated_center.save
    end
end
