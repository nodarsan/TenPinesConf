class CreateTalkDurations < ActiveRecord::Migration
  def change
    create_table :talk_durations do |t|
      t.integer :value

      t.timestamps
    end
  end
end
