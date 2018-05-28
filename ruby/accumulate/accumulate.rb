class Array
  def accumulate(&block)
    self.class.accumulate_recursive(self, [], &block)
  end

  def self.accumulate_recursive(ary, receiver, &block)
    return receiver if ary.empty?
    head, *tail = ary
    accumulate_recursive(tail, receiver << block.call(head), &block)
  end
end
