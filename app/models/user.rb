class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :celebrations, dependent: :destroy

  validates :name, presence: true
end
