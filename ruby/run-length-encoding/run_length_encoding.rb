module BookKeeping
  VERSION = 2
end

class RunLengthEncoding
  def self.encode(input)
    count = 1
    (1..input.size).each_with_object('') do |i, result|
      if input[i] != input[i - 1]
        result << count.to_s if count > 1
        result << input[i - 1]
        count = 1
      else
        count += 1
      end
    end
  end

  def self.decode(input)
    count = ''
    (0..input.size - 1).each.with_object('') do |i, result|
      count << input[i] && next if input[i] =~ /\d/

      what_to_add = input[i].nil? ? input[i - 1] : input[i]
      what_to_add *= count.to_i unless count.empty?
      result << what_to_add
      count = ''
    end
  end
end
