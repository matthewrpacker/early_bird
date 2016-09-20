class Order < ApplicationRecord
  belongs_to :user

  def date(datetime)
    date = DateTime.parse(datetime.to_s)
    formatted_date = date.strftime('%b %d, %Y')
  end

  def time(datetime)
    date = DateTime.parse(datetime.to_s)
    formatted_time = date.strftime('%l:%M %p')
  end

  def format_price(price)
    '%.2f' % (price.to_i)
  end

end
