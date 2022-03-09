=begin
write a prgram that converts decimal numbers to roman numerals

- must work up to about 3000
- class called RomanNumerals
- the constructor takes a decimal number as a argument
- objects call a method called 'to_roman' which returns the roman numeral

- rules from roman numerals...
I -> 1
v -> 5
X -> 10
L -> 50
C -> 100
D -> 500
M -> 1000

to_roman method:
takes an integer, and converts it to a roman numeral string which is returned.
input: @int instance variable via getter method call
return: string

A:


option 2: 
convert int to string, then array of charcs.
from array.size down to 1:
  get the hash corresponding to that place
  get the numeral from the hash for that digit and add to result string
return the result string

=end

class RomanNumeral
  NUMERALS = { 
    1 => ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'],
    2 => ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC'],
    3 => ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM'],
    4 => ['', 'M', 'MM', 'MMM']
   }

  attr_reader :integer

  def initialize(integer)
    @integer = integer
  end

  def to_roman
    roman_str = ''
    arr = integer.dup.to_s.chars.map(&:to_i)
    arr.size.downto(1) do |place|
      roman_str << NUMERALS[place][arr[-place]]
    end
    roman_str
  end
end