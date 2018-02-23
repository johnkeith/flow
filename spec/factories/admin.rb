FactoryBot.define do
  factory :admin do
    name 'test admin'
    account
    password 'Asdf123!'
    sequence :email do |n|
      "test_admin_#{n}@example.com"
    end
  end
end
