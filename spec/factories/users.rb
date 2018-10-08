FactoryBot.define do
  factory :user do
    name { Facker::Name.name }
    email 'foo@bar.com'
    password 'foobar'
  end
end