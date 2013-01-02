# encoding: utf-8

Fabricator(:user) do
  name { Faker::Name.name }
  email { |attrs| "#{attrs[:name].parameterize}@example.com" }
end

Fabricator(:authentication) do
  provider { %w(twitter github facebook google).sample }
  uid { Faker::Lorem.sentences(1)  }
end
