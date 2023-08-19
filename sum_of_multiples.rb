=begin

program takes a number, a set of numbers, and finds the sum of the multiples of the numbers in the set
that are less than the given number

- class called SumOfMultiples which takes a list of numbers as arguments upon instantiation.
- if a list of numbers is not given, the collection defaults ot 3 and 5
- class has an instance and a class method called `to` which takes a number as an argument, 
and returns the desired sum. 
- if no possible solution, return zero

D:
class variable defaulted to [3, 5]
if an object is instantiated with a list of numbers, it reassignes the class variable to the list
`to` instance method, and a `to` class method

A:
constructor takes a list of arguments and converts it to an array, reassigning the class variable

instance to:
  takes an integer
  sets sum to zero
  iterates from 1 up to the integer minus one and for each:
    iterates through the colletion in the class variable and for each:
    if top-level num can evenly be divided by collection element, increment a counter
    by the top-level num
  returns the sum variable

class to:
  calls instance to in an instance of class, where the argument passed in is 
  the default collection prepended by *
=end


class SumOfMultiples
  def self.to(target)
    new.to(target)
  end

  def initialize(*new_collection)
    @collection = new_collection.empty? ? [3, 5] : new_collection
  end

  def to(target)
    sum_num = 0
    (1...target).each do |candidate|
      sum_num += candidate if @collection.any? { |el| (candidate % el).zero? }
    end
    sum_num
  end
end


