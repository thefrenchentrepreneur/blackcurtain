class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :email
      t.string :letter

      t.timestamps
    end
  end
end
