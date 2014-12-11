class AddSpeakerToUser < ActiveRecord::Migration
  def change
    add_reference :users, :speaker, index: true
  end
end
