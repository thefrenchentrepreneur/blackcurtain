class RenameGuessesToNumGuessesInApps < ActiveRecord::Migration
  def change
    rename_column :apps, :guesses, :num_guesses
  end
end
