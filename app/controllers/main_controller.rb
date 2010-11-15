class MainController < ApplicationController
  
  def index
    @sites = Site.approved.not_reference.all :limit => 10, :order => 'id desc'
    
    @comments = Comment.all :limit => 10, :order => 'id desc'
  end
end
