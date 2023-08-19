=begin
program calculates the hamming distance between two single strands of DNA. 

The hamming distance is defined as the number of point mutations between two homologous 
single strands. so ATGC and AGGC have a hamming distance of 1.

This is for strands of equal length, if unequal, only measure the shorter length.

define a DNA class which takes a string upon instantiation which is stored as a state
in the DNA instance.

define a 'hamming_distance' method which takes a string, and computes the hamming 
distance between that string and the calling object's strand.
if either of the strings are zero-length, return zero
  returns an integer
does not mutate the caller's strand.

A: 
finds the shortest string of the two
iterates through the shorter string, and for each char:
  if it is not the same as the char in the other string at that index, 
  add 1 to distance, which is returned by the method.
=end

class DNA
  def initialize(strand)
    # raise ArgumentError, "Invalid Deoxyribonucleotide" if strand.match(/[^ACGT]/)
    @strand = strand
  end

  def hamming_distance(other_strand)
    distance = 0
    shortest_length = [@strand, other_strand].map(&:size).min

    0.upto(shortest_length - 1) do |index|
      distance += 1 if @strand[index] != other_strand[index]
    end
    distance
  end
end

dna = DNA.new("AECG")
