class Celebration < ApplicationRecord
  belongs_to :user
  has_many :letters, dependent: :destroy
  has_one :bouquet, dependent: :destroy

  has_secure_password :view_password, validations: false
  validates :view_password, length: { minimum: 6 }, allow_nil: true
  before_validation :ensure_share_url, on: :create
  validates :title, :giver_name, :receiver_name, presence: true
  validates :share_url, presence: true, uniqueness: true

  private

  def ensure_share_url
    self.share_url ||= SecureRandom.urlsafe_base64(16)
  end
end
