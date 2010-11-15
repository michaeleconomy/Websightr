class CommentsController < ApplicationController
  before_filter :load_user, :only => [:user]
  before_filter :require_sign_in, :except => [:show, :index, :user]
  
  def user
    @comments = @user.comments.paginate :page => params[:page], :order => 'id desc'
  end
  
  def create
    @comment = Comment.new params[:comment]
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.js do
          render :text => "comment added"
        end
      end
      return
    end
    
    respond_to do |format|
      format.js do
        render :text => @comment.errors.full_messages.join(","), :status => 400
      end
    end
    
  end
end
