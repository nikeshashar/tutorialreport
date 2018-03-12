FactoryBot.define do
  factory :user do
    trait :standard_user do
      email 'an_email@email.com'
      password '123456'
      admin false
    end
    trait :admin do
      email 'an_email@email.com'
      password '123456'
      admin true
    end
  end
end
