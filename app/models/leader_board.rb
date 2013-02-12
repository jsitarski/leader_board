class LeaderBoard < ActiveRecord::Base
  attr_accessible :date, :description, :game
  has_and_belongs_to_many :fans
  has_many :scores
  default_scope order('game ASC')
  
  # helper method to generate redis keys
  def redis_key(str)
    "leader_board:#{self.id}:#{str}"
  end
  
  def top_10_scores
    top_10_score_ids = $redis.zrevrange(self.redis_key('scores'), 0, 10)
    Score.find(top_10_score_ids).sort_by {|score| top_10_score_ids.index(score.id.to_s)}
  end

end
