# frozen_string_literal: true
FactoryGirl.define do
  factory :nico_tag, class: 'Nico::Tag' do
    name { FFaker::Lorem.word }
  end
end
