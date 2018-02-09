class CreateTeam < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name

      t.timestamps
    end

    add_foreign_key :teams, :accounts
  end
end
