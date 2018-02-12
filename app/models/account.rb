class Account < ApplicationRecord
  has_many :admins
  has_many :surveys
  has_many :teams
end
