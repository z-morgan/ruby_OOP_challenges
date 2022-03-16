=begin
class called BeerSong
  - has a class method called verse, which takes an integer, and returns at formulaic string
  containing that integer, and next lowest integer.
    - When the argument is 1, use a custom verse 
    - When the argument is zero, use another custom verse
    - multiple arguments can be passed in, and multiple verses will be returned.
    - if two arguments are passed in, and they are more than one number different, return all
      of the verse between and including those numbers

  - has a class method called lyrics, which returns the whole song.

D:
three versions of the verse, 99-2, 1, and 0. store in a hash with the numbers as keys

A:
from the first argument, down to the second argument, call the single verse method with each num
and append the return value onto a string, which is returned. 

A:


=end

require 'pry'

class BeerSong

  def self.verses(*num)
    song = ''
    num[0].downto(num[-1]) do |int_num|
      song << verse(int_num)
      song << "\n" unless int_num == num[-1]
    end
    song
  end

  def self.lyrics
    verses(99, 0)
  end

  def self.verse(num)
    case num
    when 3..99
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    when 2
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottle of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end

# p BeerSong.verses(99, 98)