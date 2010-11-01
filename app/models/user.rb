class User < ActiveRecord::Base
  has_many :authorizations
  has_many :comments, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  has_many :sites_created, :classname => 'Site', :foreign_key => 'creator_user_id'
end
