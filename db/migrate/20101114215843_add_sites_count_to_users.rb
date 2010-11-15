class AddSitesCountToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :sites_count, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :users, :sites_count
  end
end
