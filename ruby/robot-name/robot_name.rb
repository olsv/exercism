require 'set'
require 'singleton'

module BookKeeping
  VERSION = 2
end

class Registry
  include Singleton

  def initialize
    @names = Set.new
  end

  def add(name)
    @names << name
  end

  def contains?(name)
    @names.include? name
  end
end

class Robot
  attr_reader :name

  def initialize
    @registry = Registry.instance
    reset
  end

  def reset
    @name = generate_name while @name.nil? || @registry.contains?(@name)
    @registry.add(@name)
  end

  def generate_name
    (Array('A'..'Z').sample(2) << Random.rand(999)).join
  end
  private :generate_name
end
