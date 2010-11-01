class Site < ActiveRecord::Base
  belongs_to :creator_user, :class_name => 'User', :counter_cache => true
  
  has_many :comments, :dependent => :destroy, :as => 'resource'
  has_many :ratings, :dependent => :destroy, :as => 'resource'
end
