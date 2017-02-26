class UsersController < ApplicationController
  def destroy
    current_user.try(:destroy)
    redirect_to root_path
  end
end
