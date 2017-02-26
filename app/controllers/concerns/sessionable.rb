module Sessionable
  extend ActiveSupport::Concern

  COOKIE_NAME = :nf

  included do
    helper_method :logged_in?
    helper_method :logged_out?
    helper_method :current_user
  end

  private

  def logged_in?
    current_user.present?
  end

  def logged_out?
    !logged_in?
  end

  def current_user
    current_session.try(:user)
  end

  def current_session
    return @current_session if instance_variable_defined?(:@current_session)

    @current_session = if current_session_token.present?
                         User::Session.eager_load(:user).find_by(token: current_session_token)
                       else
                         nil
                       end
  end

  def current_session_token
    cookies.encrypted[COOKIE_NAME].to_s
  end

  def current_user=(user)
    new_session = user.sessions.create(
      user_agent: request.user_agent,
      remote_addr: request.remote_ip
    )

    self.current_session = new_session
  end

  def current_session=(new_session)
    if new_session.present?
      cookies.permanent.encrypted[COOKIE_NAME] = {
        value: new_session.token,
        domain: :all,
        httponly: true,
        secure: request.ssl?
      }
    else
      current_session.try(:destroy)
      cookies.delete(COOKIE_NAME)
    end
  end

  def required_login
    redirect_to root_path if logged_out?
  end
end
