class Api::VideosController < Api::ApplicationController
  def create
    ApplicationRecord.transaction do
      params[:videos].each do |video|
        Nico::Video.register(video)
      end
    end

    head :ok
  end
end
