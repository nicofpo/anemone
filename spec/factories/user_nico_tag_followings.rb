FactoryGirl.define do
  factory :user_nico_tag_following, class: 'User::NicoTagFollowing' do
    user nil
    nico_tag nil
  end
end
