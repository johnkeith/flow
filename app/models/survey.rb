class Survey < ApplicationRecord
  belongs_to :account
  has_many :survey_reponses, dependent: :destroy
  has_many :team_members, through: :survey_reponses
end
