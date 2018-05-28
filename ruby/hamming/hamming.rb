module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(a, b)
    raise ArgumentError unless a.length == b.length

    a.chars.each_with_index.inject(0) do |acc, (char, idx)|
      char == b[idx] ? acc : acc + 1
    end
  end
end
