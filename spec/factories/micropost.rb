FactoryBot.define do
  factory :micropost do
    content { 'MyString' }
    association :user
  end
end
