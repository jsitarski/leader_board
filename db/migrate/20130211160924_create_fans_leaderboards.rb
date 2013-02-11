class CreateFansLeaderboards < ActiveRecord::Migration
  def change
    create_table :fans_leaderboards do |t|

      t.timestamps
    end
  end
end
