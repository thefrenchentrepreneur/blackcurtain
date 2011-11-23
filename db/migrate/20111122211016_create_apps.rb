class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.integer :current_letter
      t.timestamp :date_released
      t.string :email

      t.timestamps
    end
  end
end
