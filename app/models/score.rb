class Score < ActiveRecord::Base
  attr_accessible :leaderboard_id, :player, :points
end
