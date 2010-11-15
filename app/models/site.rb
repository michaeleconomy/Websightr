class Site < ActiveRecord::Base
  belongs_to :creator_user, :class_name => 'User', :counter_cache => true
  
  has_many :comments, :dependent => :destroy, :as => 'resource'
  has_many :ratings, :dependent => :destroy, :as => 'resource'
  
  
  validates_size_of :name, :minimum => 1
  
  attr_protected :creator_user_id, :approved_at
  
  def to_display_name
    name
  end
  
  def self.approved
    where("approved_at is not null")
  end
  
  def self.not_approved
    where("approved_at is null")
  end
  
  def self.not_reference
    where("reference = ?", false)
  end
end
