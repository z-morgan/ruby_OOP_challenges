=begin
compute the hamming distance between two DNA strands
- if the strands are of unequal length, only consider the common subsections

Observations/Requierments:

- DNA class
  - takes a string representing a strand upon object instantiation
  - has a `hamming_distance` method which takes a string representing
      another strand
      - returns a number representing the hamming distance between the 
          argument strand and the calling object's strand (calling strand)

rules:
- treat empty strands has having no difference (hamming distance of 0)
- hamming distance is computed by comparing the characters at each index, 
    starting from the left
- when either strand is longer, ignore the additional characters
- do not mutate the strings representing strands


A:
find the length of the shorter strand
  if a.size < b.size
    set endIdx to a.size - 1
  else 
    set endIdx to b.size - 1
iterate from 0 to that length, and for each index
  if the characters are unequal, increment a counter
return the value of the counter.

=end

class DNA
  def initialize(seq_str)
    @nucleotide_sequence = seq_str
  end

  def hamming_distance(seq_str)
    strand_a = @nucleotide_sequence
    strand_b = seq_str

    # idx = strand_a.size < strand_b.size ? strand_a.size : strand_b.size
    # idx -= 1
    idx = [strand_a, strand_b].map(&:size).min - 1

    distance = 0
    while idx >= 0
      distance += 1 if strand_a[idx] != strand_b[idx]
      idx -= 1
    end

    distance
  end
end