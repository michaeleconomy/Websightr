class SessionsController < ApplicationController
  def create
    auth = request.env['rack.auth']
    unless @auth = Authorization.find_by_provider_and_uid(auth['provider'], auth['uid'])
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      user ||= User.create!(:name => auth['user_info']['name'])
      @auth = Authorization.create(:user => user, :uid => auth['uid'], :provider => auth['provider'])
    end
    # Log the authorizing user in.
    self.current_user = @auth.user

    render :text => "Welcome, #{current_user.name}."
  end
end
