class TeamMember < ApplicationRecord
  belongs_to :team
  has_many :survey_reponses
end
