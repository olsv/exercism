class Prime
  def self.nth(number)
    raise ArgumentError if number < 1

    known = [2]
    candidate = known.last

    while known.size < number
      candidate += 1
      known << candidate unless known.find { |prime| (candidate % prime).zero? }
    end

    candidate
  end
end
