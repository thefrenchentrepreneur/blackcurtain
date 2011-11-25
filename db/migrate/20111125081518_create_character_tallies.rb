class CreateCharacterTallies < ActiveRecord::Migration
  def change
    create_table :character_tallies do |t|
      t.integer :app_id
      t.string :letter
      t.integer :count

      t.timestamps
    end
  end
end
