def v2
  sum = 0
  (0..9).each { |i|
    sum += 1.0 / (3 ** i)
  }
  sum
end

puts v2

def v5(n)
  sum = 0
  a = 2
  (0..n).each {
    sum = (a + sum)**0.5
  }
  sum
end

puts v5(10)


