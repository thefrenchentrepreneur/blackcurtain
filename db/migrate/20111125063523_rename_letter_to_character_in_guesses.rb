class RenameLetterToCharacterInGuesses < ActiveRecord::Migration
  def change
    rename_column :guesses, :letter, :character
  end
end
