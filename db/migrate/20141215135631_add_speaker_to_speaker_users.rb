class AddSpeakerToSpeakerUsers < ActiveRecord::Migration
  def change
    add_reference :speaker_users, :speaker, index: true
  end
end
