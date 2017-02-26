class TimelineController < ApplicationController
  before_action :required_login

  def users
    videos = Nico::Video.arel_table
    followings = User::NicoUserFollowing.arel_table
    following_users = followings.
      project(Arel.sql('*')).
      where(followings[:user_id].eq(current_user.id)).
      as('following_users')

    conds = videos.
      join(following_users, Arel::Nodes::InnerJoin).
      on(following_users[:nico_user_id].eq(videos[:user_id])).
      join_sources

    @videos = Nico::Video.joins(conds).order(id: :desc).limit(30)
    render :videos
  end

  def tags
    videos = Nico::Video.arel_table
    followings = User::NicoTagFollowing.arel_table
    tags = Nico::Tag.arel_table
    tagging = Nico::VideoTagging.arel_table

    following = followings.
      project(Arel.star).
      where(followings[:user_id].eq(current_user.id)).
      as('following_tags')

    tagging_cond = videos.
      join(tagging, Arel::Nodes::InnerJoin).
      on(tagging[:video_id].eq(videos[:id])).
      join_sources

    tag_cond = tags.
      join(tags, Arel::Nodes::InnerJoin).
      on(tagging[:tag_id].eq(tags[:id])).
      join_sources

    follow_tag_cond = tags.
      join(following, Arel::Nodes::InnerJoin).
      on(following[:nico_tag_id].eq(tags[:id])).
      join_sources

    @videos = Nico::Video.
      joins(tagging_cond).
      joins(tag_cond).
      joins(follow_tag_cond).
      order(id: :desc).limit(30)
    render :videos
  end

  def all
    @videos = Nico::Video.order(id: :desc).limit(30)
    render :videos
  end
end
