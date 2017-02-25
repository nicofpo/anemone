# frozen_string_literal: true
class Nico::User < ApplicationRecord
  validates :nid, uniqueness: true

  has_many :videos, class_name: 'Nico::Video', foreign_key: :user_id
end
