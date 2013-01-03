# encoding: utf-8

Fabricator(:user) do
  name { Faker::Name.name }
  email { |attrs| "#{attrs[:name].parameterize}@example.com" }
end

Fabricator(:authentication) do
  provider { %w(twitter github facebook google).sample }
  uid { Faker::Lorem.sentence(1) }
end

Fabricator(:event) do
  title { Faker::Lorem.sentence(rand(7)) }
  content { Faker::Lorem.paragraphs(5).join("\n") }
end
