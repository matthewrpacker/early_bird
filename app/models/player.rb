class Player < ApplicationRecord
  include Utils
  belongs_to :user
  validates :name, presence: true
  validates :phone, presence: true
end
