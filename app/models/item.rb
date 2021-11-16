class Item < ApplicationRecord
  belongs_to :store
  belongs_to :category
  validates :name, presence: true
  validates :price,presence: true
end
