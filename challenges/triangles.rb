=begin
write a program that determines if a triangles is equilateral, isosceles, or scalene.
- equilateral - all sides are equal in length
- isosceles - two sides have the same length
- scalene - all sides have different lengths

note: must ensure that the triangle is a possible triange: all sides must be greater then
zero length, and the sum of the lengths of any two sides must be greater than the third.

class name is Triangle
objects of this class take three integers and lengths
method called 'kind' which returns a string cooresponding to the type of triangle

should raise an argument error if the lengths provided do not make a valid triangle

=end

class Triangle
  def initialize(a, b, c)
    @sides = [a, b, c]
    raise(ArgumentError) unless valid_triangle?(sides)
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  attr_reader :sides

  def valid_triangle?(sides)
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
  end
end