=begin
program takes a word, and an array of other words, and returns an array containing the words
in the input array that can be rearranged to form the input word. 

class called Anagram
when an Anagram object is instantiated, it is passed a string.

there is a #match method which takes an array of strings as an argument
#match returns an array containing the words in the input array that are anagrams

- a word that matches the input word is not an anagram
- case does not matter in determining a match

A:
initialize an empty array
iterate thorough the input array and for each string:
  next if string == word
  add string to storage_arr if string.sort == word.sort 
returns the storage_arr

=end


class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(list)
    list.each_with_object([]) do |candidate, anagrams|
      next if word == candidate.downcase
      anagrams << candidate if word.chars.sort == candidate.downcase.chars.sort
    end
  end
end
