class Bowler < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :username, :email, :password,
                  :password_confirmation, :remember_me, :contact_info

  #validations
  validates :first_name, :presence => true,
            :format => { :with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed" }
  validates :last_name, :presence => true,
            :format => { :with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed" }
  validates :email, :presence => true
  validates :username, :presence => true
  validates :password, :presence => true, :confirmation => true
  validates :password_confirmation, :presence => true

  #relationships
  belongs_to :contact_info, :dependent => :destroy
  #belongs_to :entry

  #protected
  #def self.find_for_database_authentication(warden_conditions)
  #  puts "FIND FOR DB - Model"
  #  #login = conditions.delete(:username)
  #  #where(conditions).where(["username = :username OR email = :username",
  #  #                         {:username => login}]).first
  #
  #  conditions = warden_conditions.dup
  #
  #  if(login = conditions.delete(:username).downcase)
  #    puts "In login part: #{login}"
  #    where(conditions).where('$or' => [ { :username => /^#{Regexp.escape(login)}$/i } ]).first
  #  else
  #    puts "In else part: #{where(conditions).first}"
  #    where(conditions).first
  #  end
  #end
end
