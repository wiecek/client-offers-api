class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  before_save :ensure_authentication_token

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.exists?(authentication_token: token)
    end
  end
end
