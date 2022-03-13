=begin
program determines if numbers are perfect, abundant, or defficient

perfect: the sum of the divisors is equal to the num
abundant: the sum of teh divisors is greater than the num
deficent: the sum of the devisors is less than the num

- class called PerfectNumber
- class method called `classify` which takes the number
- classify raises a standard error if the number is negative
- classify returns a string explaining the classification

A:
initialize total variable
iterate from 1 up to the number and for each int:
  increment total variable by int if it divides int evenly

compare the total to the number and return the result of comparison

=end

class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1

    case aliquot_sum(num)
    when num then 'perfect'
    when 0...num then 'deficient'
    else 'abundant'
    end
  end

  class << self # this allows us to operate on the class itself as an object
    private     # private method does not normally work for class methods. This escapes that issue

    def aliquot_sum(num)
      total = 0
      1.upto(num - 1) do |int|
        total += int if num % int == 0
      end
      total
    end
  end
end
