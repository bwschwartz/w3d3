require 'byebug'
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

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge(arr1, arr2)
  merged = []
  while arr1.length >0  && arr2.length > 0
    if arr1[0] < arr2[0]
      merged << arr1[0]
      arr1.delete_at(0)
    else
      merged << arr2[0]
      arr2.delete_at(0)
    end
  end
 merged + arr1 + arr2
end

arr1 = [3, 27, 100]
arr2 = [9, 10, 1000, 100000]

# p merge(arr1, arr2)

def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  left, right = arr[0...mid], arr[mid..-1]
  merge(merge_sort(left), merge_sort(right))
end

# p merge_sort([38, 27, 43, 3, 9, 82, 10, 100, 14, -12])


def subsets(arr)
  return [arr] if arr.length == 0
  last = arr[-1]
  without_last = subsets(arr[0...-1])
  without_last + without_last.map { |sub| sub + [last]}
end
# p (subsets([1, 2]))
# p subsets([1, 2, 3])
# [[], [1], [2], [1, 2]]

def perm(arr)
  return arr if arr.length == 1
  return [[arr.first, arr.last], [arr.last, arr.first]] if arr.length == 2

  last = arr[-1]
  smaller_perm = perm(arr[0...-1])

  perms = []

  smaller_perm.each do |permutation|
    temp_perm = permutation.deep_dup
    for i in (0..permutation.length)
      perms << temp_perm.deep_dup.insert(i, last)
    end
  end
  perms
end

p perm([1, 2, 3, 4, 5])

def greedy_make_change(amt, coins)
  # coins = [25, 10, 5, 1]
  # amt = 0 < coins[-1]
  return nil if amt < coins[-1]
  out_coins = []
  while amt > 0
    if amt - coins[0] > 0
      amt -= coins[0]
      out_coins = coins[0]
    end
  end
  out_coins += greedy_make_change(amt, coins[1..-1])
end

p greedy_make_change(32, [25, 10, 5, 1])