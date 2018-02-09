class TeamMember < ApplicationRecord
  belongs_to :team
  has_many :survey_responses
  has_many :surveys, through: :survey_responses
end
