class AddHashToApps < ActiveRecord::Migration
  def change
    add_column :apps, :hash, :string
  end
end
