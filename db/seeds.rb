# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

oil = OilPattern.create(:id => 1, :name => 'Kegel Winding Road', :url => 'http://www.kegel.net/userfiles/file/patterns/Kegel%20Sport%20Series%20-%20WINDING%20ROAD_REPORT.pdf')

b = BowlingCenter.create(:id => 1, :name => 'AMF Broadway Lanes', :url => "something.com")
a = BowlingCenter.create(:id => 2, :name => 'Arapahoe Bowling Center', :url => "something.com")
g = BowlingCenter.create(:id => 3, :name => 'Golden Bowl', :url => "something.com")


Tournament.create(:id => 1, :name => "Broadway Open", :date => 20100923, :format => "Standard", :oil_pattern => oil, :bowling_center => b)
Tournament.create(:id => 2, :name => "Arapahoe Challenge", :date => 20101019, :format => "Standard", :oil_pattern => oil, :bowling_center => a)
Tournament.create(:id => 3, :name => "Golden Bowl Open", :date => 20101117, :format => "Match Play", :oil_pattern => oil, :bowling_center => g)
