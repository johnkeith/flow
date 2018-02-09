class CreateSurveyResponse < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_responses do |t|

    t.timestamps
    end
  end


end
