def range_recur(start, last)
  return [] if last <= start
  [start] + range_recur(start + 1, last)
end

def range_iter(start, last)
  range = []
  i = start
  while i < last
    range << i
    i += 1
  end
  range
end

def exp_first(b, n)
  return 1 if n == 0
  b * exp_first(b, (n-1))
end

# p exp_first(3, 3)

def exp_second(b, n)
  return 1 if n == 0
  if n.even?
    exp_second(b, (n/2)) * exp_second(b,(n/2))
  else
    b * exp_second(b,(n-1)/2) * exp_second(b,(n-1)/2)
  end
end

# p exp_second(3,2)

class Array
  def deep_dup
    duped = []
    self.each do |el|
      if !el.is_a?(Array)
        duped << el
      else
        duped << el.deep_dup
      end
    end
    duped
  end
end

def fib(n)
  # return [0] if n == 1
  # return [0,1] if n == 2
  return [0,1][0...n] if n <= 2
  prev = fib(n-1)
  prev << prev[-1] + prev[-2]
  prev
end

def bsearch(arr,target)
  arr.length.even? ? i = arr.length/2 - 1 : i = arr.length/2 
  return i if arr[i] == target
  return nil if !arr.include?(target)
  left, right = arr[0...i], arr[i+1..-1]
  bsearch(left,target) || bsearch(right,target) + i + 1 
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil