FactoryGirl.define do
  factory :user_nico_user_following, class: 'User::NicoUserFollowing' do
    user { FactoryGirl.build(:user) }
    nico_user { FactoryGirl.build(:nico_user) }
  end
end
