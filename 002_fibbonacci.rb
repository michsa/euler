#2

def fibonacci (a, b, t)
  puts "fibonacci: #{a}, #{b}, #{t}"
  if b % 2 == 0
    t += b
  end
  if b < 4000000
    return fibonacci b, a+b, t
  end
  
  return t
end

puts fibonacci 1, 2, 0
