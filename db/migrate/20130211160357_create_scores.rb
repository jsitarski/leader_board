class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :player
      t.integer :leaderboard_id
      t.integer :points

      t.timestamps
    end
  end
end
