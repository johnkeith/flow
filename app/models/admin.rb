class Admin < ApplicationRecord
  include Auth
  belongs_to :account
end
