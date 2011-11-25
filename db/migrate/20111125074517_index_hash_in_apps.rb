class IndexHashInApps < ActiveRecord::Migration
  def change
    add_index :apps, :hash
  end
end
