puts 'Введіть t:'
t = gets.to_f

puts 'Введіть φ:'
fi = gets.to_f

puts 'Введіть x:'
x = gets.to_f

e = Math::E
pi = Math::PI

Z = Math.tan((e**t + 3**fi) / Math.sqrt((t**2 + 2).abs)) - ((Math.cos(fi)**3 + 2.8 * 10**(-3.4) + x) / (Math.sin(pi - 4)**3 + 1.2)**(1.0/5))

puts "Z = #{Z}"
