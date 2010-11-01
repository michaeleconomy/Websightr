class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.integer :comments_count, :default => 0, :null => false
      t.integer :sites_created_count, :default => 0, :null => false
      t.integer :ratings_count, :default => 0, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
