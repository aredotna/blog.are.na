Jtt.helpers do

  # Not using this ATM... but fun.
  def rot(string)
    string.tr 'A-Za-z','N-ZA-Mn-za-m'
  end

  def encrypt_value(val); Encryptor.encrypt(val, :key => KEY); end
  def decrypt_value(val); Encryptor.decrypt(val, :key => KEY); end

  def slug_encode(slug)
    Base64.urlsafe_encode64(encrypt_value(slug))
  end

  def slug_decode(slug)
    decrypt_value(Base64.urlsafe_decode64(slug))
  end

end
