class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :user_id, :null => false
      t.integer :resource_id, :null => false
      t.string :resource_type, :limit => 128, :null => false
      t.text :body, :null => false
      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, [:resource_id, :resource_type]
  end

  def self.down
    drop_table :comments
  end
end
