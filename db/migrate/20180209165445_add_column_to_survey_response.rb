class AddColumnToSurveyResponse < ActiveRecord::Migration[5.1]
  def change
    add_column :survey_responses, :survey_id, :integer, null: false
    add_column :survey_responses, :team_member_id, :integer, null: false
    add_column :survey_responses, :account_id, :integer, null: false
  end
end
