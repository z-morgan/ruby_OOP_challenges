=begin
program takes a string of digits, and returns all possible overlapping
substrings of the specified length. 

Defined a class `Series`, which takes a string of digits upon 
instantiation of a Series object. Define an instance method `slices`
which takes an integer as an argument (call it "slice_len"), and returns a nested array
where the sub-arrays are all possible consecutive-overlapping 
sequences, where the length of each sequence is the argument.

- input upon object instantiation: string of digits
- input upon invoking 'slices': integer
- #slices returns: nested array of integer subsequences

- when slice_len is 1, `series` returns sub-arrays each holding one digit
- when slice_len is 2, 'series' returns overlapping sub-arrays w/ two
    consecutive digits as elements.
- the magnitude-order of the digits is irrelevant, only their position
    in the string matters.
- if slice_len is greater than the length of the string, throw an ArgumentError

Edge cases not covered: 
- What if string is empty? Return empty array?
- What if string contains non-digit characters? Should be irrelevant, since
    the magnitude of the digits does not matter.


D: storage array (nested array)


A:
Series' constructor must take a string
  store the string as an array of integers?

#slices takes an integer
  guard: if the integer is greater than the length of the digits_array
            raise ArgumentError

  initialize an empty result array
  iterate from index 0 to index string_length - slice_len and for each index
    initialize an empty sub-array
    add slice_len number of elements to the array
      starting at current index, loop slice_len times, adding the 
      element at current index to the array and then incrementing
      the index
    add that array to the result array
  return the result array


  Notes for Refactoring:
  - Can I use #each_cons to make this solution more concise?
  - What about the non-covered edge-cases that I mentioned above?
=end

class Series
  attr_reader :digits_arr

  def initialize(digits_str)
    @digits_arr = digits_str.chars.map(&:to_i)
  end

  def slices(slice_len)
    raise ArgumentError if slice_len > digits_arr.length

    result = []

    0.upto(digits_arr.length - slice_len) do |index|
      sub_arr = []
      sub_idx = index

      slice_len.times do
        sub_arr << digits_arr[sub_idx]
        sub_idx += 1
      end

      result << sub_arr
    end

    result
  end

end
