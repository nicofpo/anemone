# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include Sessionable

  before_action :force_domain if Rails.env.production?

  protect_from_forgery with: :exception

  private

  def force_domain
    return if ENV['FORCE_DOMAIN'].blank?

    redirect_to("https://#{ENV['FORCE_DOMAIN']}/", status: 301) if request.host != ENV['FORCE_DOMAIN']
  end

  def peek_enabled?
    Rails.env.development?
  end
end
