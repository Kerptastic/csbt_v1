class Bowler < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :username, :email, :password,
                  :password_confirmation, :remember_me, :contact_info,
                  :birthday, :height_ft, :height_in, :joined_date, :current_avg,
                  :career_avg, :hometown_city, :hometown_state, :num_titles, :bio,
                  :picture_url, :num_threes, :num_eights, :high_series, :high_game

  #validations
  validates :first_name, :presence => true,
            :format => {:with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed"}
  validates :last_name, :presence => true,
            :format => {:with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed"}
  validates :email, :presence => true
  validates :username, :presence => true
  validates :password, :presence => true, :confirmation => true
  validates :password_confirmation, :presence => true

  #relationships
  belongs_to :contact_info, :dependent => :destroy
  #belongs_to :entry

  def full_name
    "#{first_name} #{last_name}"
  end

  def height
    "#{height_ft}'#{height_in}\""
  end

  def self.current
    Thread.current[:bowler]
  end

  def self.current=(bowler)
    Thread.current[:bowler] = bowler
  end
end
