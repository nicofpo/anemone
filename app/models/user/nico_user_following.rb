class User::NicoUserFollowing < ApplicationRecord
  belongs_to :user
  belongs_to :nico_user, class_name: 'Nico::User'

  validates :user_id, uniqueness: { scope: :nico_user_id }
end
