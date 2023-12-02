
def integrate_r(a, b, n, dx = (b - a) / n)
  x = a + dx / 2
  sum = 0
  (1..n).each {
    y = yield(x)
    sum += dx * y
    x += dx
  }
  return sum
end

def integrate_t(a, b, n, dx = (b - a) / n)
  x = a + dx
  sum = dx * (yield(a) / 2 - yield(b) / 2)
  loop {
    y = yield(x)
    sum += dx * y
    x += dx
    break if x > b
  }
  return sum
end

def f1(x)
  return ((Math.asin(x**0.5))/((x*(1-x))**0.5))
end

def f2(x)
  return (Math.tan((x/2)+(Math::PI/4))**3.0)
end

x = integrate_r(0.2, 0.3, 100000.0) {|x| f1(x)}
puts x, "\n"
x = integrate_t(0.2, 0.3, 100000.0) {|x| f1(x)}
puts x, "\n"

x = integrate_r(0.0, Math::PI/8, 100000.0) {|x| f2(x)}
puts x, "\n"
x = integrate_t(0.0, Math::PI/8, 100000.0) {|x| f2(x)}
puts x, "\n"