class CreateFansLeaderboards < ActiveRecord::Migration
  def change
    create_table :fans_leader_boards do |t|
      t.integer :fan_id
      t.integer :leader_board_id
      t.timestamps
    end
  end
end
