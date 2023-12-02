def forward_elimination(a, b, n)
  for i in 0...n
    for j in i+1...n
      factor = a[j][i].to_f / a[i][i]
      for k in i...n
        a[j][k] -= factor * a[i][k]
      end
      b[j] -= factor * b[i]
    end
  end
end

def back_substitution(a, b, n)
  x = Array.new(n, 0.0)
  for i in (n-1).downto(0)
    sum = 0
    for j in i+1...n
      sum += a[i][j] * x[j]
    end
    x[i] = (b[i] - sum) / a[i][i]
  end
  x.map { |el| el.round(2) }
end

def gauss(a, b, n)
  forward_elimination(a, b, n)
  back_substitution(a, b, n)
end

def print_matrix(matrix)
  matrix.each do |row|
    puts row.map { |el| '%5.2f' % el }.join(' ')
  end
end

def print_vector(vector)
  vector.each { |el| puts '%5.2f' % el }
end

def print_system(a, b, n)
  puts "System:"
  n.times do |i|
    equation = a[i].each_with_index.map { |el, j| "#{el}x#{j+1}" }.join(' + ')
    puts "#{equation} = #{b[i]}"
  end
end

def print_solution(x)
  puts "Solution:"
  x.each_with_index { |el, i| puts "x#{i+1} = #{el}" }
end

puts "Enter the dimension of the system n (from 3 to 9):"
n = gets.chomp.to_i
puts "Enter the number of your computer (k):"
k = gets.chomp.to_i

unless (3..9).include?(n)
  puts "The dimension must be within the range of 3 to 9"
  exit
end

a = Array.new(n) { |i| Array.new(n) { |j| i == j ? 2 : k + 2 } }
b = (1..n).to_a

puts "Matrix A:"
print_matrix(a)

puts "Vector b:"
print_vector(b)

print_system(a, b, n)

x = gauss(a, b, n)

print_solution(x)
