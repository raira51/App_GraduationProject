class BouquetFlower < ApplicationRecord
  belongs_to :flower
  belongs_to :bouquet

  validates :count, numericality: { only_integer: true, greater_than: 0 }
end
