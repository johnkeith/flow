class Admin < ApplicationRecord
  include Authenticatable
  has_secure_password
  
  validates :name, :email, presence: true

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
