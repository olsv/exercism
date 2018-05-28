module BookKeeping
  VERSION = 3
end

class Gigasecond
  GIGASECOND = 1_000_000_000
  
  def self.from(datetime)
    datetime + GIGASECOND
  end
end