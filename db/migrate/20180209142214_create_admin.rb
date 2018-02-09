class CreateAdmin < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :name

      t.timestamps
    end

    add_foreign_key :admins, :accounts
  end
end
