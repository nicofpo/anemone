# frozen_string_literal: true
class Nico::User < ApplicationRecord
  validates :nid, uniqueness: true

  has_many :videos, class_name: 'Nico::Video', foreign_key: :user_id

  def self.register(hash)
    user = self.find_or_initialize_by(nid: hash['id'])
    %w(nickname icon_url).each do |key|
      user[key] = hash[key] if hash[key].present?
    end
    user.save!

    return user
  end
end
