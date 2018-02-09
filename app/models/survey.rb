class Survey < ApplicationRecord
  belongs_to :account
  has_many :survey_responses, dependent: :destroy
  has_many :team_members, through: :survey_responses
end
