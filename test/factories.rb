FactoryGirl.define do

  factory(:post) do
    name Faker::Lorem.sentence
    body Faker::Lorem.paragraph
    author
  end

  factory(:author) do
    name Faker::Name.name
    twitter "@#{Faker::Name.name}"
    email Faker::Internet.email
  end

end