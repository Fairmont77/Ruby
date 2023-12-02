a = false
b = false
c = false
x = -8
y = -10
z = -12

puts "a)#{!(a || b) && (a && !b)}"
puts "b)#{(z != y) == (6 >= y) && a || b && c && x>=1.5}"
puts "c)#{(8 - x * 2 <= z) && (x**2 <= y**2) ||  (z >= 15)}"
puts "d)#{x > 0 && y < 0 || z >= (x * y - (-y / x)) + (-z)}"
puts "e)#{!(a || b && !(c || (!a || b)))}"
puts "f)#{x^2 + y^2 >= 1 && x >= 0 && y >= 0}"
puts "g)#{(a && (c && b == b || a) || c) && b}"



x = -0.5
p = true


puts "#2 #{!(Math.exp(2*x)>3.1415/3) && !p}"