class Celebration < ApplicationRecord
  belongs_to :user
  has_many :letters, dependent: :destroy
  has_one :bouquet, dependent: :destroy

  has_secure_password :view_password, validations: false
  
  validates :short_message, length: { maximum: 30 }, allow_blank: true
  before_validation :ensure_share_url, on: :create
  validates :title, :giver_name, :receiver_name, presence: true
  validates :share_url, presence: true, uniqueness: true
  validates :view_password, length: { maximum: 10 }, allow_nil: true

  enum status: { draft: 0, published: 1 }
  before_validation :ensure_share_url, on: :create

  private

  def ensure_share_url
    self.share_url ||= SecureRandom.urlsafe_base64(16)
  end
end
