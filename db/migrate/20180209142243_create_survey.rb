class CreateSurvey < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.string :name

      t.timestamps
    end

    add_foreign_key :surveys, :accounts
  end
end
