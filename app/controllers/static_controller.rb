class StaticController < ApplicationController
  def top_page
    Nico::User.all.to_a
  end
end
