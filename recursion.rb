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

p exp_first(3, 3)

def exp_second(b, n)
  return 1 if n == 0
  b * exp_first(b, (n-1))
end