class Bob
  def hey(phrase)
    case phrase
    when /\A[A-Z\W\d]+\Z/
      'Whoa, chill out!'
    when /\?\Z/
      'Sure.'
    else
      'Whatever.'
    end
  end
end
