class User < ActiveRecord::Base
  has_many :authorizations
  has_many :comments, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  has_many :sites_created, :class_name => 'Site', :foreign_key => 'creator_user_id'
  
  def to_display_name
    name
  end
  
  def admin?
    id == 1
  end
  
  def self.with_sites
    where("sites_count > 0")
  end
end
