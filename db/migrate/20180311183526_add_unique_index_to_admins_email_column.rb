class AddUniqueIndexToAdminsEmailColumn < ActiveRecord::Migration[5.1]
  def change
    add_index :admins, :email, unique: true
  end
end
