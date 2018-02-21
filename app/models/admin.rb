class Admin < ApplicationRecord
  include Authenticatable
  has_secure_password
  
  belongs_to :account
end
