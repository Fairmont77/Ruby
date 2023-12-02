def factorial(n)
  (1..n).inject(1, :*)
end

def task_1(n_terms)
  sum = 0.0
  (2..n_terms).each do |n|
    sum += ((factorial(n - 1).to_f / factorial(n + 1)) ** n*(n + 1))
  end
  sum
end


def task_2_cos(x, n_terms)
  sum = 0.0
  n_terms.times do |n|
    term = ((-1)**n) * (x**(2*n) / factorial(2*n).to_f)
    sum += term
  end
  sum
end


=begin
x_value = Math::PI / 3
n_terms = 10
cos_approx = task_2_cos(x_value, n_terms)
cos_actual = Math.cos(x_value)

puts "Наближене значення косинуса: #{cos_approx}"
puts "Точне значення косинуса: #{cos_actual}"
puts "Різниця: #{(cos_approx - cos_actual).abs}"
=end


def task_3(n_terms)
  sum = 0.0
  (1..n_terms).each do |n|
    numerator = n * factorial(2*n - 1)
    denominator = factorial(3*n) * (4**(2*n)) * factorial(2*n + 1)
    sum += numerator.to_f / denominator
  end
  sum
end
