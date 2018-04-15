include ActionDispatch::TestProcess

FactoryBot.define do
  factory :tutorial do
    title 'Code Academy'
    description 'The go to tutorial'
    link 'https://www.codecademy.com/'
    rating 9
  end
end
