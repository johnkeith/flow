FactoryBot.define do
  factory :admin do
    name 'test admin'
    account

    trait :invalid do
      name nil
      id nil
      account_id nil
    end
  end
end
