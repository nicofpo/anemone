# frozen_string_literal: true
class Nico::Video < ApplicationRecord
  belongs_to :user, class_name: 'Nico::User'
  has_many :taggings, class_name: 'Nico::VideoTagging', foreign_key: :video_id
  has_many :tags, through: :taggings, source: :tag

  validates :nid, uniqueness: true

  def self.register(hash)
    video = self.find_or_initialize_by(nid: hash['id'])

    return video if video.persisted?

    %w(title description thumbnail_url).each do |key|
      video[key] = hash[key]
    end
    video.first_retrieve_at = Time.zone.parse(hash['first_retrieve'])
    video.user = Nico::User.register(hash['user'])

    video.taggings = hash['tags'].map do |tag_hash|
      tag = Nico::Tag.find_or_create_by!(name: tag_hash['name'])
      Nico::VideoTagging.new(video: video, tag: tag)
    end

    video.save!
    return video
  end

  def url
    "http://www.nicovideo.jp/watch/#{nid}"
  end
end
