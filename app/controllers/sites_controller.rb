class SitesController < ApplicationController
  before_filter :load_user, :only => [:user]
  before_filter :load_site, :only => [:show, :edit, :update, :destroy, :approve]
  before_filter :verify_site_owner, :only => [:edit, :update, :destroy]
  
  before_filter :require_sign_in, :except => [:show, :index, :user]
  before_filter :require_admin, :only => [:pending_approval]
  
  def index
    @sites = Site.approved.not_reference.paginate :page => params[:page], :order => 'id desc'
  end
  
  def pending_approval
    @sites = Site.not_approved.paginate :page => params[:page], :order => 'id'
  end
  
  def show
    
  end
  
  def user
    @sites = @user.sites.paginate :page => params[:page], :order => 'id desc'
  end
  
  # edit_actions
  
  def new
    @site ||= Site.new params[:site]
  end
  
  def create
    @site = Site.new params[:site]
    @site.creator_user_id = current_user.id
    if @site.save
      respond_to do |format|
        format.html do
          redirect_to @site
        end
      end
    end
  end
  
  def edit
    @site.attributes = params[:site]
  end
  
  def update
    @site.attributes = params[:site]
    if @site.save
      respond_to do |format|
        format.html do
          redirect_to @site
        end
      end
    end
    render :action => 'edit'
  end
  
  def destroy
    @site.destroy
  end
  
  
  def approve
    @site.approved_at = Time.now
    @site.save!
    render :text => 'approved'
  end
  
  private
  
  def verify_site_owner
    unless signed_in? &&
           (current_user.id == @site.creator_user_id || current_user.admin?)
      respond_to do |format|
        format.html do
          flash[:notice] = "You can't edit this site."
          redirect_to @site
        end
      end
      return false
    end
    
    true
  end
end
