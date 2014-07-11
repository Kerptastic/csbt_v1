class Bowler < ActiveRecord::Base
    attr_accessible :first_name, :last_name, :contact_info, :birthday, :height_ft, :height_in, :joined_date,
                    :hometown_city, :hometown_state, :bio, :picture_url, :stats, :stats_attributes

    #validations
    validates :first_name, :presence => true, :uniqueness => { :scope => :last_name },
              :format                => { :with => /\A[a-zA-Z]+\z/, :message => 'Only letters allowed' }
    validates :last_name, :presence => true,
              :format               => { :with => /\A[a-zA-Z]+\z/, :message => 'Only letters allowed' }


    #relationships
    has_one :contact_info
    has_one :stats, :class_name => 'BowlerStats'
    belongs_to :user
    has_many :entries

    accepts_nested_attributes_for :stats
  
    #methods
    def full_name
        "#{first_name} #{last_name}"
    end

    def height
        "#{height_ft}'#{height_in}\""
    end

    def profile_url
        "/bowler/#{last_name.downcase}.#{first_name.downcase}"
    end



end
