class BowlersController < ApplicationController
    #
    def index
        @bowlers

        if params[:chosenletter].nil?
            @bowlers = Bowler.where('last_name LIKE ?', 'A%');
        else
            @bowlers = Bowler.where('last_name LIKE ?', "#{params[:chosenletter]}%");
        end
    end

    #
    def new
        @bowler = Bowler.new
    end

    #
    def create
        @saved_bowler = Bowler.new(params[:bowler])
        @saved = @saved_bowler.save

        render :new
    end

    #
    def show
        @bowler = Bowler.where(:last_name => params[:lastname], :first_name => params[:firstname]).first
    end

    #
    def edit
        @bowler = nil

        if !current_user.nil? && !current_user.bowler.nil? && !current_user.bowler.id.nil?

            if current_user.bowler[:first_name].downcase == params[:firstname].downcase && current_user.bowler[:last_name].downcase == params[:lastname].downcase
                @bowler = current_user.bowler
            else
                redirect_to :action => 'badboy'
            end
        else
            redirect_to :action => 'badboy'
        end
    end

    #
    def update
        @b = Bowler.find("#{current_user.bowler.id}")
        @b.update_attributes params[:bowler]

        redirect_to :action => 'show'
    end

    #
    def badboy
        #log something here
    end

    def all
        @bowlers = Bowler.where("last_name LIKE :prefix", prefix: "#{params[:last_name]}%").order('last_name')

        respond_to do |format|
            format.js { render :json => @bowlers }
        end
    end
end
