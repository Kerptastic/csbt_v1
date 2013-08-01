class BowlerStats < ActiveRecord::Base
  attr_accessible :high_3_game_set, :high_4_game_set, :high_6_game_set, :high_8_game_set, :titles, :majors,
                  :num_events, :num_games, :total_pinfall, :career_avg, :career_money, :num_cashes, :match_play_wins,
                  :match_play_matches, :high_series, :high_game, :num_300s, :num_800s

  has_one :high_3_game_set, :class_name => 'Entry'
  has_one :high_4_game_set, :class_name => 'Entry'
  has_one :high_6_game_set, :class_name => 'Entry'
  has_one :high_8_game_set, :class_name => 'Entry'
  belongs_to :bowler
end


#def career_pinfall
#  #career_pinfall = 0
#  #
#  #entries.each do |e|
#  #    career_pinfall += e.total_pinfall
#  #end
#  #
#  #career_pinfall
#  self.stats.career_pinfall
#end
#
#def career_num_games
#  #num_games = 0
#  #
#  #entries.each do |e|
#  #    num_games += e.total_games
#  #end
#  #
#  #num_games
#  self.stats.num_games
#end
#
#def career_avg
#  #career_pinfall / career_num_games
#  self.stats.career_avg
#end
#
#def num_titles
#  #wins = 0
#  #
#  #entries.each do |e|
#  #    wins += 1 if e.is_winner?
#  #end
#  #
#  #wins
#  self.stats.titles
#end
#
#def tourneys_bowled
#  entries.count
#end
#
#def total_majors
#  majors = 0
#
#  entries.each do |e|
#    if e.is_winner?
#      if e.tournament.is_major?
#        majors += 1
#      end
#    end
#  end
#
#  majors
#end
#
#def best_3_game_total
#  best = 0
#  date = ''
#
#  entries.each do |e|
#    if e.highest_3_games > best
#      best = e.highest_3_games
#      date = e.tournament.date.strftime('%m/%d/%Y')
#    end
#  end
#
#  { :total => best, :date => date }
#end
#
#def best_6_game_total
#  best = 0
#  date = ''
#
#  entries.each do |e|
#    if e.highest_6_games > best
#      best = e.highest_6_games
#      date = e.tournament.date.strftime('%m/%d/%Y')
#    end
#  end
#
#  { :total => best, :date => date }
#end
#
#def best_8_game_total
#  best = 0
#  date = ''
#
#  entries.each do |e|
#    if e.highest_8_games > best
#      best = e.highest_8_games
#      date = e.tournament.date.strftime('%m/%d/%Y')
#    end
#  end
#
#  { :total => best, :date => date }
#end