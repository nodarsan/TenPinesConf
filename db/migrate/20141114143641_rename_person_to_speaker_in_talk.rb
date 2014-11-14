class RenamePersonToSpeakerInTalk < ActiveRecord::Migration
  def change
    rename_column :talks, :person_id, :speaker_id
  end
end
