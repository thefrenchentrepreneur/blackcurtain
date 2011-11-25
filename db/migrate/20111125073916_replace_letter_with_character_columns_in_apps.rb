class ReplaceLetterWithCharacterColumnsInApps < ActiveRecord::Migration
  def change 
    change_table :apps do |t|
      t.rename :current_letter_position, :current_character_position
      t.rename :date_last_letter_released, :date_last_character_revealed
    end
  end
end
