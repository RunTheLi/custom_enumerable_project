module Enumerable
  # Your code goes here
  def my_all?
    each do |element|
      return true if element > 0
    end
    false
  end

  def my_any?
    each do |element|
      return true if yield(element)
    end
    false
  end

  def my_count(item = nil)
    return size unless block_given? || item

    count = 0
    each { |element| count += 1 if item ? element == item : yield(element) }
    count
  end
  
  def my_each(item = nil)
    return size unless block_given? || item

    count = 0
    each { |element| count += 1 if item ? element == item : yield(element) }
    count
  end

  def my_each_with_index 
    for index in 0...self.length
      yield(self[index], index)
    end
    self
  end

  def my_inject(initial = nil)
    result = initial || first
    each do |element|
      result = yield(result, element)
    end
    result
  end

  def my_map
    result = []
    each do |element|
      result << yield(element)
    end
    result
  end
  
  def my_none?(&block)
    each do |element|
      return false if block_given? ? block.call(element) : element
    end
    true
  end

  def my_select 
    result = []
    each do |element|
      result << element if yield(element)
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here 
  def my_each
    for element in self
      yield(element)
    end
    self
  end
end