# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include Sessionable

  protect_from_forgery with: :exception
end
