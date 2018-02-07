class Survey < ApplicationRecord
  belongs_to :account
  has_many :survey_reponses
end
