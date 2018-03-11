class Admin < ApplicationRecord
  include Authenticatable
  has_secure_password
  
  belongs_to :account

  def self.mutable_fields
    [
      :name,
      :email,
      :password, 
      :password_confirmation
    ]
  end
end
