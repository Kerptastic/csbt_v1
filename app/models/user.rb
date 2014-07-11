class User < ActiveRecord::Base
    # Setup Devise for Authentication
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    #Setup accessible (or protected) attributes for your model
    attr_accessible :username, :email, :password, :bowler,
                    #not changeable
                    :password_confirmation, :remember_me

    #validations
    validates :email, :presence => true
    validates :username, :presence => true
    validates :password, :presence => true, :confirmation => true
    validates :password_confirmation, :presence => true

    #relationships
    has_one :bowler

    #methods
    def self.current
        Thread.current[:user]
    end

    def self.current=(user)
        Thread.current[:user] = user
    end
end
