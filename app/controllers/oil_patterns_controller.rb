class OilPatternsController < ApplicationController

    def index
        @oil_patterns = OilPattern.all.sort { |a, b| a.id <=> b.id }

        respond_to do |format|
            format.js { render :json => @oil_patterns }
        end
    end

    def create
        @new_pattern = OilPattern.new(params[:oil_pattern])

        @saved = @new_pattern.save
    end

    def update
        updated = params[:oil_pattern]

        @updated_pattern = OilPattern.find(updated[:id])

        @updated_pattern.name = updated[:name]
        @updated_pattern.url = updated[:url]

        @saved = @updated_pattern.save
    end
end
