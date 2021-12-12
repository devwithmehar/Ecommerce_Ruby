class Province < ApplicationRecord
  validates :name, presence: true
  validates :GST, presence: true
  validates :PST, presence: true
  validates :HST, presence: true
end
