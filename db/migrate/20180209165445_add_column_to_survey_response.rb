class AddColumnToSurveyResponse < ActiveRecord::Migration[5.1]
  def change
    add_column :survey_responses, :survey_id, :integer
    add_column :survey_responses, :team_member_id, :integer
  end
end
