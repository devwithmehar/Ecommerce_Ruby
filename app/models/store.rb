class Store < ApplicationRecord
  has_many : categories
  validates :name, presence: true
  validates :email, uniqueness: true
end
