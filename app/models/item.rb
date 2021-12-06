class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :store
  belongs_to :category
  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  paginates_per 9
end
