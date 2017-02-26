FactoryGirl.define do
  factory :user_session, class: 'User::Session' do
    user { FactoryGirl.build(:user) }
  end
end
