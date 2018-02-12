class TeamMember < ApplicationRecord
  belongs_to :team
  belongs_to :account
  has_many :survey_responses
  has_many :surveys, through: :survey_responses
end
