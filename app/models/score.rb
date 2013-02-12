class Score < ActiveRecord::Base
  belongs_to :leader_board
  attr_accessible :leader_board_id, :player, :points
  
  after_create :add_to_leaderboard

  def add_to_leaderboard
    $redis.zadd self.leader_board.redis_key(:scores), self.points, self.id
  end
  
  # helper method to generate redis keys
  def redis_key(str)
    "score:#{self.id}:#{str}"
  end
end
