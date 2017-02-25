# frozen_string_literal: true
FactoryGirl.define do
  factory :nico_video, class: 'Nico::Video' do
    nid { 'sm' + (rand * 10_000).floor.to_s }
    title { FFaker::Lorem.words(3).join(' ') }
    description { FFaker::Lorem.paragraph }
    thumbnail_url 'http://tn-skr1.smilevideo.jp/smile?i=30712528'
    length 100
    first_retrieve_at { Time.zone.now }
    user { FactoryGirl.build(:nico_user) }
  end
end
