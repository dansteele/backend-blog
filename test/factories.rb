FactoryGirl.define do

  factory(:post) do
    title "cool beans"#Faker::Lorem.sentence
    body Faker::Lorem.paragraph
    author
  end

  factory(:author) do
    name Faker::Name.name
    twitter "@#{Faker::Name.name}"
    email Faker::Internet.email
    password Faker::Name.name
    tc 1
  end

end