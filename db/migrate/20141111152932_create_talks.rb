class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.text :description
      t.references :person, index: true
      t.references :talk_track, index: true
      t.references :talk_duration, index: true

      t.timestamps
    end
  end
end
