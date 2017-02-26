class Api::VideosController < Api::ApplicationController
  def create
    unless Rack::Utils.secure_compare(params[:secret].to_s, Rails.application.secrets.rudbeckia_secret.to_s)
      return head :forbidden
    end

    ApplicationRecord.transaction do
      params[:videos].each do |video|
        Nico::Video.register(video)
      end
    end

    head :ok
  end
end
