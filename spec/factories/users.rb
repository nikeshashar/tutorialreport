FactoryBot.define do
  factory :user do
    trait :standard_user do
      email 'standard_user@email.com'
      password '123456'
      admin false
    end
    trait :admin do
      email 'admin@email.com'
      password '123456'
      admin true
    end
  end
end
