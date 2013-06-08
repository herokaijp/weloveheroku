# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site do
    name Faker::Name.name
    url Faker::Internet.url
    description Faker::Lorem.paragraph
    hash_tag '#twitter_hash_tag'
    repository_url 'http://github.com/herokai/weloveheroku'
    scheduled_access false
    please_design false
  end
end
