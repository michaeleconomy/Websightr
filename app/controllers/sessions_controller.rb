class SessionsController < ApplicationController
  before_filter :load_user, :only => [:fake_sign_in]
  
  def create
    auth = request.env['rack.auth']
    unless @auth = Authorization.find_by_provider_and_uid(auth['provider'], auth['uid'])
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      user ||= User.create!(:name => auth['user_info']['name'])
      @auth = user.authorizations.create(:uid => auth['uid'], :provider => auth['provider'])
    end
    # Log the authorizing user in.
    self.current_user = @auth.user

    flash[:notice] = "Welcome, #{current_user.name}."
    redirect_to "/"
  end
  
  def fake_sign_in
    unless Rails.env.development?
      render :text => "", :status => 404
      return
    end
    self.current_user = @user
    
    
    flash[:notice] = "Welcome, #{current_user.name}."
    redirect_to "/"
  end
end
