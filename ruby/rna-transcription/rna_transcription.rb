module BookKeeping
  VERSION = 4
end

class Complement
  MAPPING = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }
  
  def self.of_dna(source)
    return '' if source =~ /[^GCTA]/
    source.chars.map { |char| MAPPING[char] }.join
  end
end