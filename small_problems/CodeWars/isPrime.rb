require 'pry'
def isPrime(num)
  possible_list = (2..Math.sqrt(num)).to_a
  return false if num <= 1
  if num > 10
    possible_list.select! do |possible_number|
      case 
        when possible_number % 2 == 0 && possible_number != 2
        false
        when possible_number % 3 == 0 && possible_number != 3
        false
        when possible_number % 5 == 0 && possible_number != 5
        false
        when possible_number % 7 == 0 && possible_number != 7
        false
        else 
        true
      end
    end
  end
  possible_list.each do |possible_number|
    if num % possible_number == 0
      return false
    end
  end
  return true
end
# p isPrime(4)
# p isPrime(100)
# p isPrime(999)
# p isPrime(958297)
# p isPrime(0)
# p isPrime(-7)

p isPrime(2)
# p isPrime(3)
# p isPrime(5)