class CreateLeaderBoards < ActiveRecord::Migration
  def change
    create_table :leader_boards do |t|
      t.string   :game
      t.string   :description
      t.datetime :date

      t.timestamps
    end
  end
end
