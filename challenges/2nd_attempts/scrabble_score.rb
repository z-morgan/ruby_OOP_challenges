=begin
compute the scrabble score of a word

requirements:

class called `Scrabble` which takes a string upon objct instatiation
  - has a `score` method which returns the score as an integer
  - white space is scored as 0
  - empty strings are scored as 0
  - non-string objects passed to constructor are scored as 0
  - case is not considered


DS:
  a hash with scores as keys and arrays of characters as values

A:
if the argument is not a string, return 0

remove all non-letter chars from string
upcase the string
convert string to array
iterate through the letters, transforming each to it's score
sum the numbers and return the result



=end

class Scrabble
  SCORES = {
    1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }

  def self.score(word)
    self.new(word).score
  end

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def score
    return 0 unless word.class.eql? String

    letters = word.upcase.delete('^A-Z')
    return 0 if letters == ''

    scores = letters.chars.map do |letter|
      SCORES.select{ |k, v| v.include?(letter) }.keys[0].to_i
    end
    
    scores.reduce(&:+)
  end
end

# Scrabble.new('hello  woRLD').score