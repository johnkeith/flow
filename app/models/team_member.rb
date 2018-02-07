class TeamMember < ApplicationRecord
  belongs_to :team
  has_many :survey_reponses
  has_many :surveys, through: :survey_reponses
end
