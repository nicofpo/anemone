# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Nico::Tag, type: :model do
  subject(:tag) { FactoryGirl.build(:nico_tag) }

  it { should be_valid }
end
