class User::Session < ApplicationRecord
  TOKEN_BYTES = 16

  belongs_to :user

  validates :token, uniqueness: true

  after_initialize :generate_token

  def generate_token
    return if token?

    while token.blank? || self.class.where(token: token).exists?
      self.token = SecureRandom.hex(TOKEN_BYTES)
    end
  end
end
