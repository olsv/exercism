require 'set'
module BookKeeping
  VERSION = 2
end

class Pangram
  ALPHABET = ('a'..'z').to_set

  def self.is_pangram?(string)
    used_letters = string.chars.inject(Set.new) do |acc, char|
      char.downcase!
      ALPHABET.include?(char) ? acc << char : acc
    end

    ALPHABET.difference(used_letters).empty?
  end
end
