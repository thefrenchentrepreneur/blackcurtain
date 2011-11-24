class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :email
      t.integer :current_letter_position
      t.timestamp :date_last_letter_released

      t.timestamps
    end
  end
end
