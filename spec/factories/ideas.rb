FactoryGirl.define do
  factory :idea do
    association :user, factory: :user
    title { Faker::Hacker.noun}
    body { Faker::Hipster.paragraph}
  end
end
