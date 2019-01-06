class Message < ApplicationRecord
  validates :first_name, :last_name, :email, :amount, presence: true
  validates :email, uniqueness: true
end
