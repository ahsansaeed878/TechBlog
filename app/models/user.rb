class User < ApplicationRecord
  has_many :articles
  before_create :confirmation_token
  has_secure_password
  validates :name, length: { minimum: 4, maximum: 20 }
  validates :password, length: { minimum: 6, maximum: 16 }
  validates :name, :password, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
 # validates :email #, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end
  private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
