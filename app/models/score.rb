class Score < ActiveRecord::Base
  belongs_to :leader_board
  attr_accessible :player, :points
end
