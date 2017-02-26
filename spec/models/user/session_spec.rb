require 'rails_helper'

RSpec.describe User::Session, type: :model do
  subject(:session) { FactoryGirl.build(:user_session) }

  it { should be_valid }
end
