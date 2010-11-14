class User < ActiveRecord::Base
  has_many :authorizations
  has_many :comments, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  has_many :sites_created, :class_name => 'Site', :foreign_key => 'creator_user_id'
end
