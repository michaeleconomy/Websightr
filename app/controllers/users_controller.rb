class UsersController < ApplicationController
  before_filter :load_user, :only => [:show]
  
  
  def show
    
  end
end
