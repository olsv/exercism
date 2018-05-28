module BookKeeping
  VERSION = 2
end

class Raindrops
  MAPPING = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }
  
  def self.convert(number)
    result = ""
    
    MAPPING.keys.each do |factor| 
      result += MAPPING[factor] if number % factor == 0
    end
          
    result.empty? ? number.to_s : result
  end
end