=begin
program takes a string, and sums the score of it's letters.

class is called Scrabble which takes a string upon instantiation
  it seems the the constructur has some guard clause which ensures that the input
  is a valid string of alphabetical characters.
instance method `score` which returns the score integer
class method `score` which does the same thing but it takes a string directly

score A:
initiate a score variable
iterate through the chars in string and for each:
  get the score that matches teh character
  increment teh score by that integer
return the score
=end

class Scrabble
  LETTER_VALUES = {
    1 => ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'],
    2 => ['d', 'g'],
    3 => ['b', 'c', 'm', 'p'],
    4 => ['f', 'h', 'v', 'w', 'y'],
    5 => ['k'],
    8 => ['j', 'x'],
    10 => ['q', 'z']
  }

  def initialize(input)
    @word = validate_word(input).downcase
  end

  def score
    score = 0
    @word.each_char do |letter|
      score += LETTER_VALUES.find{ |_, v| v.include?(letter) }.first
    end
    score
  end

  def self.score(string)
    Scrabble.new(string).score
  end

  private

  def validate_word(input)
    return '' if input.class != String
    input.gsub(/[^a-z]/i, '')
  end
end
