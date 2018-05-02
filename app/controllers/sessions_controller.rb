class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[user_id] = @user.idea
    redirect_to :root
  end

  def destroy
    session[user_id] = nil
    redirect_to :root
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
