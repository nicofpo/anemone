# frozen_string_literal: true
FactoryGirl.define do
  factory :nico_user, class: 'Nico::User' do
    nid { (rand * 1_000_000).floor.to_s }
    nickname 'Nico Nico User'
    icon_url 'https://secure-dcdn.cdn.nimg.jp/nicoaccount/usericon/defaults/blank_s.jpg'
  end
end
