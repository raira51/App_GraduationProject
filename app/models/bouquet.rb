class Bouquet < ApplicationRecord
  belongs_to :celebration
  has_many :bouquet_flowers, dependent: :destroy
  has_many :flowers, through: :bouquet_flowers
end
