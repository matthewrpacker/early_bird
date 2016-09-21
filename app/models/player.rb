class Player < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :phone, presence: true

  # def format_phone_for_database(phone)
  #   "+1#{phone}"
  # end

  def format_phone_for_view(phone)
    phone = phone.tr('+1', '')
    phone.insert(3, '-')
    phone.insert(7, '-')
  end
end
