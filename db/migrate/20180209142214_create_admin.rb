class CreateAdmin < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :name
    end
  end
end
