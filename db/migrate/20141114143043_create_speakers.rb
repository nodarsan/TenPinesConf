class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :mail
      t.string :phone
      t.string :country
      t.text :bio

      t.timestamps
    end
  end
end
