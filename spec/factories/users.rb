FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| Faker::Name.name + "#{n}"}
    sequence(:email) { |n| Faker::Internet.email.gsub("@", "#{n}@")}
    password { Faker::Internet.password }
  end
end
