class User::NicoTagFollowing < ApplicationRecord
  belongs_to :user
  belongs_to :nico_tag, class_name: 'Nico::Tag'

  validates :user_id, uniqueness: { scope: :nico_tag_id }
end
