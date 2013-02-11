class Score < ActiveRecord::Base
  belongs_to :leader_board
  attr_accessible :leader_board_id, :player, :points
end
