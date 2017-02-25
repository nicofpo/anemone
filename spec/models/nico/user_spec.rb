# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Nico::User, type: :model do
  subject(:user) { FactoryGirl.build(:nico_user) }

  it { should be_valid }
end
