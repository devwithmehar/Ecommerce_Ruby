class Store < ApplicationRecord
  has_many :categories
  has_many :items
  validates :name, presence: true
  validates :email, uniqueness: true
end
