class User < ApplicationRecord
  has_many :sessions, class_name: 'User::Session', dependent: :destroy
  has_many :nico_user_followings, class_name: 'User::NicoUserFollowing', dependent: :destroy
  has_many :following_nico_users, through: :nico_user_followings, source: :nico_user
  has_many :nico_tag_followings, class_name: 'User::NicoTagFollowing', dependent: :destroy
  has_many :following_nico_tags, through: :nico_tag_followings, source: :nico_tag
end
