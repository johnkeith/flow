class AddPasswordConfirmationToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :password_digest, :string
    add_column :admins, :email, :string, null: false
  end
end
