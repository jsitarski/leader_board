class Fan < ActiveRecord::Base
  attr_accessible :hometown, :name
  has_and_belongs_to_many :leader_boards
  
  # follow a leader_board
  def follow!(leader_board)
    self.leader_boards << leader_board unless self.leader_boards.include? leader_board
    $redis.multi do
      $redis.sadd self.redis_key(:following), leader_board.id
      $redis.sadd leader_board.redis_key(:followers), self.id
    end
  end

  # unfollow a leader_board
  def unfollow!(leader_board)
    self.leader_boards.delete leader_board
    $redis.multi do
      $redis.srem self.redis_key(:following), leader_board.id
      $redis.srem leader_board.redis_key(:followers), self.id
    end
  end

  # Leader boards that this fan is following.
  def following
    leader_board_ids = $redis.smembers(self.redis_key(:following))
    LeaderBoard.where(:id => leader_board_ids)
  end
  
  def follows?(leader_board)
    $redis.smembers(self.redis_key(:following)).include? leader_board.id.to_s
  end
  
  # helper method to generate redis keys
  def redis_key(str)
    "fan:#{self.id}:#{str}"
  end
  
end
