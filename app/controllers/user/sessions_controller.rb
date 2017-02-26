class User::SessionsController < ApplicationController
  def callback
    ext_auth = User::ExtAuth.find_or_create_by!(auth_hash.slice(:provider, :uid).to_hash) do |e|
      e.user = User.new
    end

    self.current_user = ext_auth.user

    redirect_to root_path
  end

  def destroy
    self.current_session = nil

    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
