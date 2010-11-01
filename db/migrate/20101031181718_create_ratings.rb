class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :user_id, :null => false
      t.integer :rating, :null => false
      t.integer :resource_id, :null => false
      t.string :resource_type, :limit => 128, :null => false
      t.timestamps
    end
    add_index :ratings, [:user_id, :resource_id, :resource_type], :unique => true
    add_index :ratings, [:resource_id, :resource_type]
  end

  def self.down
    drop_table :ratings
  end
end
