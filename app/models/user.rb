class User < ApplicationRecord
  include Utils
  has_many :players
  has_many :orders
  validates :provider, presence: true
  validates :uid, presence: true
  validates :name, presence: true
  validates :oauth_token, presence: true, uniqueness: true
  validates :oauth_expires_at, presence: true

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
