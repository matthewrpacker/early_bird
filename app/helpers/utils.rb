module Utils
  def formatted_phone
    phone.insert(3, '-').insert(7, '-')
  end
end
