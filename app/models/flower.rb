class Flower < ApplicationRecord
  has_many :bouquet_flowers, dependent: :destroy
  has_many :bouquets, through: :bouquet_flowers
end
