class CreateTeamMember < ActiveRecord::Migration[5.1]
  def change
    create_table :team_members do |t|
      t.string :name, null: false
      t.integer :account_id, null: false
      t.integer :team_id, null: false

      t.timestamps
    end
  end
end
