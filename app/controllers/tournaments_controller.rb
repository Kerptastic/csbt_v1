class TournamentsController < ApplicationController
    #
    # Initializes all of the variables needed to create a new tournament.
    #
    def init_tournament_data
        @centers = BowlingCenter.find(:all, :order => 'name')
        @patterns = OilPattern.find(:all, :order => 'name')

        @bowler = Bowler.new
        @tourney_oil_pattern = OilPattern.new
        @tourney_bowling_center = BowlingCenter.new
    end

    #
    # Action for displaying the view to create a new tournament.
    #
    def new
        init_tournament_data

        @tournament = Tournament.new
        @tournament.set_date_to_now
    end

    #
    # Action that creates a new tournament based on the information in the
    # new tournament view.
    #
    def create
        @saved_tourney = Tournament.new(params[:tournament])

        @saved = false
        @exists = !@saved_tourney.new_record?
        @failed = @saved_tourney.invalid?

        if(@failed)
            @error_msg = 'Tournament is missing required information.'
        else
            if(!@exists)
                @saved = @saved_tourney.save

                if(!@saved)
                    @failed = true
                    @error_msg = 'Tournament failed during save. Contact Admin.'
                else
                    init_tournament_data
                end
            end
        end

        render :new
    end


    #
    # Action for permforming the activation of a tournament.
    #
    # def activate_perform
        # @tournament = Tournament.find(params[:id])
        # @tournament_setup = TournamentSetup.new(params[:tournament_setup])
# 
        # @failed = @tournament_setup.invalid?
        # @saved = @tournament_setup.save
#         
        # if(@failed)
            # @error_msg = 'Tournament Activation is missing required information.'
        # else
            # @tournament.activated = 'true'
            # @tournament.tournament_setup_id = @tournament_setup.id
#             
            # @tournament.save
# 
            # if(!@saved)
                # @failed = true
                # @error_msg = 'Tournament Activation failed during save. Contact Site Admin.'
            # end
        # end
# 
        # # @tournament.tournament_setup
# 
        # render :activate
    # end

    #
    # Action for displaying the view of pending tournaments. 
    #
    def pending
      @active_tournaments = Tournament.where('date >= ?', Date.today).order('date asc')
    end

    def direct
      @tournament = Tournament.find(params[:id])
      @entries = @tournament.entries
    end

    def edit
        init_tournament_data

        @tournament = Tournament.find(params[:id])
    end

    def update
        @updated_tourney = Tournament.find(params[:id])

        @failed = @updated_tourney.invalid?

        @updated_tourney.update_attributes(params[:tournament])
        @saved = @updated_tourney.save

        if(@failed)
            @error_msg = 'Tournament is missing required information.'
        else
            if(!@saved)
                @failed = true
                @error_msg = 'Tournament failed during save. Contact Site Admin.'
            end
        end

        render :update
    end

    def index
        if params[:index].nil?

            @tournaments = Tournament.
                where('date >= \'2013-08-01\' && date <= ?', '%d-08-01' % Date.today.year).
                includes(:bowling_center, :oil_pattern,
                         { winner: [:bowler] }, { runner_up: [:bowler] },
                         { top_woman: [:bowler] }, { top_senior: [:bowler] }).reverse_order
        else
        #parse out the index value
            year       = params[:index][0...4]
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

    def entries 
        @tourney = Tournament.find(params[:id])
        @entries = @tourney.entries.includes(:bowler)#, :tournament)
        
        # puts @entries.to_xml
        
        # puts @entries[0].bowler.to_xml
        
        respond_to do |format|
            format.js { render :json => @entries }
        end
    end
    
    def addEntry
        @entry = Entry.new
    end
end
