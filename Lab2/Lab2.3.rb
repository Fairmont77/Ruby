def toDec(value_, base = 2)
  val = 0
  value_.split('').map(&:to_i).reverse.each_with_index {
    |dig, idx|
    val += base**idx if dig == 1
  }
  return val
end

value = "111000100111"

puts toDec(value,)