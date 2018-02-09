class CreateTeamMember < ActiveRecord::Migration[5.1]
  def change
    create_table :team_members do |t|
      t.string :name

      t.timestamps
    end

    add_foreign_key :team_members, :teams
  end
end
