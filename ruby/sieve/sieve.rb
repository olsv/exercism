class Sieve
  attr_reader :maximum

  def initialize(maximum)
    @maximum = maximum
  end

  def primes
    set = Array(2..maximum)
    set.each do |el|
      set.reject! { |x| x != el && (x % el).zero? }
    end
  end
end
