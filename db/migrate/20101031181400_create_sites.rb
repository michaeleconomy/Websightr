class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :name
      t.text :description
      t.datetime :approved_at
      t.integer :ratings_count, :default => 0, :null => false
      t.integer :comments_count, :default => 0, :null => false
      t.integer :creator_user_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :sites
  end
end
