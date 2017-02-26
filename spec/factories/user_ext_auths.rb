FactoryGirl.define do
  factory :user_ext_auth, class: 'User::ExtAuth' do
    user nil
    provider "MyString"
    uid "MyString"
  end
end
