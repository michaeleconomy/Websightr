class AddMoreColsToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :url, :string
    add_column :sites, :launched_at, :datetime
    add_column :sites, :reference, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :sites, :url, :launched_at, :reference
  end
end
