# frozen_string_literal: true
class Nico::Tag < ApplicationRecord
  validates :name, uniqueness: true
end
