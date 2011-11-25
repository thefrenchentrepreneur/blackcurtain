class RenameLetterToCharacterInCharacterTallies < ActiveRecord::Migration
  def change
    rename_column :character_tallies, :letter, :character
  end
end
