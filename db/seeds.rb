require 'faker'


Account.create(id: 100, name: Faker::Name.name)


5.times do
  Admin.create(name: Faker::Name.name, account_id: 100)
end
