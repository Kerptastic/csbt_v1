class Bowler < ActiveRecord::Base
    attr_accessible :first_name, :last_name, :contact_info, :birthday, :height_ft, :height_in, :joined_date,
                    :hometown_city, :hometown_state, :bio, :picture_url, :num_threes, :num_eights,
                    :high_series, :high_game


    #validations
    validates :first_name, :presence => true,
              :format                => { :with => /\A[a-zA-Z]+\z/, :message => 'Only letters allowed' }
    validates :last_name, :presence => true,
              :format               => { :with => /\A[a-zA-Z]+\z/, :message => 'Only letters allowed' }


    #relationships
    has_one :contact_info
    belongs_to :user
    has_many :entries

    #scopes
    scope :top_ten_career_pinfall, where('').limit(10)

    #methods
    def full_name
        "#{first_name} #{last_name}"
    end

    def height
        "#{height_ft}'#{height_in}\""
    end

    def profile_url
        "/profile/#{last_name.downcase}.#{first_name.downcase}"
    end

    def career_pinfall
        career_pinfall = 0

        entries.each do |e|
            career_pinfall += e.total_pinfall
        end

        career_pinfall
    end

    def career_num_games
        num_games = 0

        entries.each do |e|
            num_games += e.total_games
        end

        num_games
    end

    def career_avg
        career_pinfall / career_num_games
    end

    def total_wins
        wins = 0

        entries.each do |e|
            wins += 1 if e.is_winner?
        end

        wins
    end

    def total_tourneys
        entries.count
    end

    def total_majors
        majors = 0

        entries.each do |e|
            if e.is_winner?
                if e.tournament.is_major?
                    majors += 1
                end
            end
        end

        majors
    end

    def best_3_game_total
        best = 0
        date = ''

        entries.each do |e|
            if e.highest_3_games > best
                best = e.highest_3_games
                date = e.tournament.date.strftime('%m/%d/%Y')
            end
        end

        { :total => best, :date => date }
    end

    def best_6_game_total
        best = 0
        date = ''

        entries.each do |e|
            if e.highest_6_games > best
                best = e.highest_6_games
                date = e.tournament.date.strftime('%m/%d/%Y')
            end
        end

        { :total => best, :date => date }
    end

    def best_8_game_total
        best = 0
        date = ''

        entries.each do |e|
            if e.highest_8_games > best
                best = e.highest_8_games
                date = e.tournament.date.strftime('%m/%d/%Y')
            end
        end

        { :total => best, :date => date }
    end

end
