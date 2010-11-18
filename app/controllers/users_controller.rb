class UsersController < ApplicationController
  before_filter :load_user, :only => [:show]
  
  
  def show
    @sites = @user.sites_created.all :limit => 10
    @comments = @user.comments.all :limit => 10
  end
end
