class AddAppIdToGuesses < ActiveRecord::Migration
  def change
    add_column :guesses, :app_id, :integer
  end
end
