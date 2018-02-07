class SurveyResponse < ApplicationRecord
  belongs_to :team_member
  belongs_to :survey 
end
