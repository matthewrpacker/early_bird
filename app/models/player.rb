class Player < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :phone, presence: true
end
