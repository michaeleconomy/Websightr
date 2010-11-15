class AddTaglineToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :tagline, :string
  end

  def self.down
    remove_column :sites, :tagline
  end
end
