class Comment < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :resource, :polymorphic => true, :counter_cache => true
  
  attr_protected :user_id
  
  validates_presence_of :resource, :user
  validates_size_of :body, :minimum => 1
end
