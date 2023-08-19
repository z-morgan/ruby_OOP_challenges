=begin
program takes an octal number (base 8) and converts it to a decimal number (base 10)

conversion looks like:
233 = 2*8^2 + 3*8^1 + 3*8^0
    = 155

- define class Octal which takes a octal number as a string upon instantiation.
- define an instance method `to_decimal` which returns an integer decimal number
- to_decimal returns zero if the string does not reflect a valid octal number
  - has non-numeric characters
  - contains 8 or 9

validate_num A:
  use a regex to ensure only 0-7 are contained in string

to_decimal:
  initialize new_decimal variable
  convert string to array of chars
  convert to ints, iterate through elements:
    raise 8 to power, and multiply by element
    add that number to new_decimal variable
    decriment power by 1
  return the new_decimal variable


=end

class Octal
  def initialize(str)
    @octal = validate_num(str)
  end

  def to_decimal
    dec = 0
    octal.to_i.digits.each_with_index do |num, idx|
      dec += (num * (8 ** idx))
    end
    dec
  end
  
  private

  def octal
    @octal.dup
  end

  def validate_num(str)
    str.match?(/[^0-7]/) ? '0' : str
  end
end