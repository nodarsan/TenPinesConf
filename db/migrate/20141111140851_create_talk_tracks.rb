class CreateTalkTracks < ActiveRecord::Migration
  def change
    create_table :talk_tracks do |t|
      t.string :name

      t.timestamps
    end
  end
end
