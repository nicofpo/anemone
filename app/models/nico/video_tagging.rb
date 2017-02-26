class Nico::VideoTagging < ApplicationRecord
  belongs_to :video, class_name: 'Nico::Video'
  belongs_to :tag, class_name: 'Nico::Tag'

  validates :video_id, uniqueness: { scope: :tag_id }
end
