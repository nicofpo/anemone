# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Nico::Video, type: :model do
  subject(:video) { FactoryGirl.build(:nico_video) }

  it { should be_valid }
end
