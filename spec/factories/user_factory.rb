FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    first_name
    last_name
    title
    admin false

    factory :admin do
      admin true
    end
  end
end
