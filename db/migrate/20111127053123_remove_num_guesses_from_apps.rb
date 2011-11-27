class RemoveNumGuessesFromApps < ActiveRecord::Migration
  def up
    remove_column :apps, :num_guesses
  end

  def down
    add_column :apps, :num_guesses, :integer
  end
end
