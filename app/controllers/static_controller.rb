class StaticController < ApplicationController
  def top_page
    @videos = Nico::Video.order(id: :desc).limit(10)
  end

  def about
  end
end
