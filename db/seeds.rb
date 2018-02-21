require 'faker'

Account.create(id: 100, name: Faker::Name.name)

5.times do
  Admin.create(name: Faker::Name.name, account_id: 100)
end

def run!
  ActiveRecord::Base.transaction do
    account = create_account
    
    create_admins(account)
  end
end

def create_account
  Account.create!(name: 'Seeds Account')
end

def create_admins(account)
  3.times do |i|
    Admin.create!(
      account: account,
      name: "Seed Admin #{i}",
      email: "seed_admin_#{i}@seeds.com",
      password: 'Asdf123',
      password_confirmation: 'Asdf123')
  end
end

run!

