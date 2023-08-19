=begin
program takes a letter, and print a diamond shape using the alphabet up to that letter.

class Diamond has one method, `make_diamond`
requirements for method:
- if A is the letter, print 'A\n'
- the first and last rows are A
- each successive row has two of the same letter, until the given letter is reached.
- then the letters ascend again until the triangle is complete.


              add "B B\n" to str
prepend and append "A\n"

               add "C   C\n" to str
prepend and append " B B \n" to str
prepend and append "  A  \n"

               add "D     D\n" to str
prepend and append " C   C \n" to str
prepend and append "  B B  \n" to str
prepend and append "   A   \n"

The index of the given letter is the same as the buffer on the first and last row
buffer starts at 0 for middle row, and increase by 1
gap starts at (buffer * 2 - 1), and decreases by 2 every row in the body

A:  (for C)
initialize an empty string variable called str
get the index of the letter in the alphebet
set buffer to 0
set gap to (index * 2 - 1)

  add "l" + (gap * ' ') + "l" + \n
  buffer += 1
  gap - 2
  index -= 1

  until index = 0:
    prepend and append (buffer * " " ) + "l" + (gap * ' ') + "l" + (buffer * " " ) + \n
    buffer += 1
    gap - 2
    index -= 1

  prepend and append (buffer * " " ) + "A" + (buffer * " " ) + \n

return str
=end

class Diamond
  ABC = ("A".."Z").to_a
  
  def self.make_diamond(letter)
    return "A\n" if letter == "A"

    index = ABC.index(letter)
    buffer = 0
    gap = (index * 2) - 1

    next_row = proc do 
      buffer += 1
      gap -= 2
      index -= 1
    end

    str = "#{letter + (" " * gap) + letter}\n"
    next_row.call
    
    until index == 0
      row = "#{(" " * buffer) + ABC[index] + (" " * gap) + ABC[index] + (" " * buffer)}\n"
      str = row + str + row
      next_row.call
    end

    row = "#{(" " * buffer) + "A" + (" " * buffer)}\n"
    row + str + row
  end
end
