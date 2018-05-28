module BookKeeping
  VERSION = 1
end

class Phrase
  def initialize(string)
    @string = string
  end

  def word_count
    @string.split(/[\s\W&&[^']]/).each_with_object({}) do |word, acc|
      next if word.empty?
      word = word.downcase.gsub(/\A'|'\Z/, '')
      acc[word] ||= 0
      acc[word] += 1
    end
  end
end
