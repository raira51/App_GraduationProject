class Letter < ApplicationRecord
  belongs_to :celebration
  validates :sender_name, length: { maximum: 30 }, presence: true
  validates :body, presence: true, length: { maximum: 2000 }
end
