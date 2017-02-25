# frozen_string_literal: true
class Nico::Video < ApplicationRecord
  belongs_to :user, class_name: 'Nico::User'

  validates :nid, uniqueness: true
end
