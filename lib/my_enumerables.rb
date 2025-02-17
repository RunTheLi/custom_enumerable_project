module Enumerable
  # Your code goes here
  def my_all?
    each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_count
    count = 0
    each do |element|
      count += 1 if yield(element)
    end
    count
  end

  def my_each
    for element in self
      yield(element)
    end
    self
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

  def my_none?
    each do |element|
      return false if yield(element)
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