class Letter < ApplicationRecord
  belongs_to :celebration
  validates :sender_name, :body, presence: true
end
