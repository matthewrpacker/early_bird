module Utils
  def formatted_phone
    phone.tr('+1', '').insert(3, '-').insert(7, '-')
  end
end
