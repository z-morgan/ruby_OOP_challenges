=begin
- class called robot
- when a robot object is instantiated, it is given a random name according to the pattern
- When the reset method is executed, the name is changed to another random name
- class has a getter for name
- the constructor sets a random name
- the generate name method must generate a new random name if the new name is taken.

A: generate name
- must generate a random name starting with two cap letters, and then 3 integers
- must check that the new name is not already in the existing_names array
- if it already exists, generate another new name.

initialize empty string
  two times, get a random letter from an uppercase alphabet array, add to string
  3 times, get a random number from a digits array, add to string
  repeat the above steps with a new empty string if the name is already in existing_names
  reset the string to empty
add string to existing_strings, and reassign name to string.


=end

class Robot
  @@existing_names = []

  attr_reader :name

  def initialize
    reset # just call reset?
  end

  def reset
    @name = generate_name
  end

  private

  def generate_name
    new_name = ''

    loop do
      2.times { new_name << ("A".."Z").to_a.sample }
      3.times { new_name << ("0".."9").to_a.sample }
      break unless @@existing_names.include?(new_name)
      new_name = ''
    end

    @@existing_names << new_name
    @name = new_name
  end
end

