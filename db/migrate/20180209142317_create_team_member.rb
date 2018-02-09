class CreateTeamMember < ActiveRecord::Migration[5.1]
  def change
    create_table :team_members do |t|
      t.string :name
    end
  end
end
