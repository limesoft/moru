# encoding: utf-8

Fabricator(:user) do
  name { Faker::Name.name }
  role { ROLE_USER }
end

Fabricator(:authentication) do
  provider { %w(twitter github facebook google).sample }
  uid { Faker::Lorem.sentence(1) }
end

Fabricator(:event) do
  title { Faker::Lorem.sentence(rand(7)) }
  content { Faker::Lorem.paragraphs(5).join("\n") }
  date { Time.now }
end

Fabricator(:topic) do
  title { Faker::Lorem.sentence(rand(2..5)) }
  content { Faker::Lorem.paragraphs(rand(1..3)).join("\n") }
end

Fabricator(:comment) do
  content { Faker::Lorem.paragraphs(2).join("\n") }
end

Fabricator(:post) do
  title { Faker::Lorem.sentence(rand(1..5)) }
  content { Faker::Lorem.paragraphs(rand(2..10)).join("\n") }
end

Fabricator(:feedback) do
  content { Faker::Lorem.paragraphs(rand(2..4)).join("\n") }
end

Fabricator(:rsvp) do
  going { RSVPS.sample }
  user
end
