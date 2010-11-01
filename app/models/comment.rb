class Comment < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :resource, :polymorphic => true, :counter_cache => true
end
