class Team < ApplicationRecord
  belongs_to :account
  has_many :team_members, dependent: :destroy
end
