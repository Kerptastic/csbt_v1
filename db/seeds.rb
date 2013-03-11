# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

bowler1 = Bowler.create(:first_name    => 'Josh', :last_name => 'Kierpiec', :birthday => '19850825', :height_ft => 5, :height_in => 10,
                        :hometown_city => 'Rome', :hometown_state => 'NY', :picture_url => 'josh_kierpiec_1.jpg', :num_threes => 6, :num_eights => 3, :high_series => 805, :high_game => 300,
                        :bio           => 'Hailing originally from Rome, New York, Josh moved to Denver in July 2009 and immediately joined the Denver bowling community. It only took Josh a little over a year to win his first Denver singles titles in the 2010 Denver Masters tournament. Josh shortly after joined the CSBT and won his first and only title at the CSBT Eliminator. Josh bowled collegiately for the Rochester Institute of Technology, and was a part of 2 top 10 ranked teams, with their best finish coming in 2008 as they placed 3rd in the National Title event. Josh currently works for a government sub-contractor as a Software Engineer, specializing in User Interface Design.')

