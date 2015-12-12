#3: prime factorization

# using a class with instance variables and a 
# static function to mimic static variables
class Prime

  # needs a couple values to initialize with,
  # specifically more primes than primorials.
  @primes = [2, 3]
  @primorials = [2]
  
  def Prime.check_prime n
    
    # first check if n is a multiple of any known prime
    @primes.each do |p|
      if n % p == 0
        return false
      end
    end
    
    current_primorial = @primorials.last
    i = current_primorial
    
    while i * i <= n
      
      if  n != (i + 1) and n % (i + 1) == 0
        return false 
      end
      
      # skip the primes that are factors of the primorial.
      # works because pml[i] = p[0] * p[1] * ... * p[i]
      (@primorials.length..@primes.length - 1).each do |p|
        if n != (i + @primes[p]) and n % (i + @primes[p]) == 0
          return false
        end
      end
      
      i += current_primorial
    end
    
    @primes << n
    
    # most of the time these will not technically be "primordials" 
    # because they will usually skip primes (those that are not 
    # factors of n) in the product. However, as they are still 
    # products of primes, they may still be used in combination
    # with known primes to weed out candidates based on coprimacy.
    if n > current_primorial and @primes.length > @primorials.length
      @primorials << current_primorial * @primes[@primorials.length]
    end
    
    return true
  end
  
  def Prime.primes
    return @primes
  end
  
  def Prime.primorials
    return @primorials
  end
  
end

n = ARGV.first.to_i or 600851475143
i_max = Math::sqrt n
factors = Array.new()
prime_factors = Array.new()

# the order of checks is important!!!
# to find all primes less than i_max,
# swap the prime check with the factor check
(2..i_max).each do |i|
  if i.odd? 
    if n % i == 0
      factors << i
      if Prime.check_prime i
        prime_factors << i
      end
    end
  end
end

puts "all primes: #{Prime.primes}"
puts "all factors: #{factors}"
puts "prime factors: #{prime_factors}"
puts "primorials: #{Prime.primorials}"
