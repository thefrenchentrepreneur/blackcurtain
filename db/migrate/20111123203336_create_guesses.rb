class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :letter
      t.string :email

      t.timestamps
    end
  end
end
