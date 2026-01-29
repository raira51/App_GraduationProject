class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :celebrations, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :name, length: { in: 3..20 }
  validates :name, format: { with: /\A[a-zA-Z][a-zA-Z0-9_]*\z/ }

  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }, allow_blank: true
  validates :password_confirmation, presence: true, on: :create
  validates :password, confirmation: true
end
