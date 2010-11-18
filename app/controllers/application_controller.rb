class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end
  
  private
  
  %w(User Site Comment Rating).each do |klass_name|
    klass = klass_name.constantize
    define_method "load_#{klass_name.underscore}" do
      instance_variable_set "@" + klass_name.underscore, klass.find(params[:id])
    end
  end
  
  def require_sign_in
    unless signed_in?
      respond_to do |format|
        format.html do
          redirect_to '/auth/facebook'
        end
      end
      return false
    end
    
    true
  end
  
  def require_admin
    unless signed_in? && current_user.admin?
      respond_to do |format|
        format.html do
          flash[:notice] = "admins only!"
          redirect_to '/'
        end
      end
      return false
    end
    
    true
  end
end
