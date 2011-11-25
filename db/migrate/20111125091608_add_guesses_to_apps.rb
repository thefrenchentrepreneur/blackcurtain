class AddGuessesToApps < ActiveRecord::Migration
  def change
    add_column :apps, :guesses, :integer
  end
end
