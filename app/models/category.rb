class Category < ApplicationRecord
  belongs_to :store
  validates :name, presence: true
  validates :name, uniqueness: true
end
