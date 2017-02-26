class SettingsController < ApplicationController
  before_action :required_login
  layout 'timeline'

  def users
    @users = current_user.following_nico_users
  end

  def add_user
    nuser = Nico::User.register('id' => params[:nid].to_i.to_s)
    current_user.following_nico_users << nuser
    @users = current_user.following_nico_users

    render :users
  end

  def del_user
    nid = Nico::User.find_by(nid: params[:nid].to_i.to_s).try(:id)
    current_user.nico_user_followings.where(nico_user_id: nid).destroy_all

    @users = current_user.following_nico_users

    render :users
  end

  def tags
    @tags = current_user.following_nico_tags
  end

  def add_tag
    tag = Nico::Tag.find_or_create_by!(name: params[:name])
    current_user.following_nico_tags << tag
    @tags = current_user.following_nico_tags
    render :tags
  end

  def del_tag
    tag_id = Nico::Tag.find_by(name: params[:name]).try(:id)
    current_user.nico_tag_followings.where(nico_tag_id: tag_id).destroy_all
    @tags = current_user.following_nico_tags
    render :tags
  end

  def etc
  end
end
