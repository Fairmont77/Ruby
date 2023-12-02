
def sum_even_negatives_and_odd_positives(array)
  sum_even_negatives = 0
  sum_odd_positives = 0

  array.each do |item|
    if item.negative? && item.even?
      sum_even_negatives += item
    elsif item.positive? && item.odd?
      sum_odd_positives += item
    end
  end

  [sum_even_negatives, sum_odd_positives]
end

a = Array.new(24) { rand(-100..100) }

sum_even_negatives, sum_odd_positives = sum_even_negatives_and_odd_positives(a)
puts "Сума парних від'ємних: #{sum_even_negatives}"
puts "Сума непарних додатніх: #{sum_odd_positives}"

n = 8

# Створення матриць A і B
a = Array.new(n) { Array.new(n) { rand(10) } }
b = Array.new(n) { Array.new(n) { rand(10) } }

# Задання діагональних елементів матриці A рівними 1
(0...n).each { |i| a[i][i] = 1 }

# Функція для виведення матриці
def print_matrix(matrix)
  matrix.each do |row|
    puts row.join(' ')
  end
end
# Створення векторів X і Y
x = Array.new(n) { rand(10) }
y = Array.new(n) { rand(10) }

scalar_product = 0
(0...n).each do |i|
  scalar_product += x[i] * y[i]
end
puts "Матриця A:"
print_matrix(a)
puts "\nМатриця B:"
print_matrix(b)
puts "Скалярний добуток векторів X і Y: #{scalar_product}"