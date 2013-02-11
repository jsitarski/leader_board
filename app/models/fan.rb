class Fan < ActiveRecord::Base
  attr_accessible :hometown, :name
  has_and_belongs_to_many :leader_boards
end
