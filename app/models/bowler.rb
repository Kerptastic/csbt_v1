class Bowler < ActiveRecord::Base
    #Setup accessible (or protected) attributes for your model
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
    belongs_to :tournament
    has_many :entries

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
end
