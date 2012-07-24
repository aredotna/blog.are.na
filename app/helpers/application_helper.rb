Jtt.helpers do

  def rot(string)
    string.tr 'A-Za-z','N-ZA-Mn-za-m'
  end

  def slug_encode(slug)
    rot(slug)
  end

  def slug_decode(slug)
    rot(slug)
  end

end
