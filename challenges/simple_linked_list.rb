=begin
create a linked-list program. functions include reversing direction and conversion to-from array

The SimpleLinkedList class has Element objects as part of its state. Each element object has the next element 
object as part of its state. the List only knows which element is on top. It does not know that order of the rest
of the elements. methods that convert to and from an array can probably use the state of each element to 
determine ordering.

- class called Element
 - takes a value upon instantiation, which is the elements value
    - takes an optional second argument, which is the 'next' element in the list
 - has an instance method called datum, which returns the value
 - has an instance method called tail? which returns true if the element has no `next` element
 - has an instance method called next, which returns the next element in the list, or nil if no 
    next element

- class called SimpleLinkedList
  - has an instance method called size, which returns the number of elements in the list, or 0
  - has an instance method called empty, which returns true or false
  - has an instance method called push, which adds instantiates a new Element object with the argument
      passed to the constructor as a value
  - has an instance method called peek, which returns the value of the next Element in the list, returns nil if empty list
  - has an instance method called head, which returns the top Element object
  - has an instance method called pop, which returns the value of the top Element, and removes it from
  the list
  - has a class method called `from_a()` which takes an array, and instantiates a list object containing
  Elements with the values in the array (first array element on top)
      A: takes an array, and returns a list object with elements containing the values of the array
      for the -1 element, instantiate an Element object with the element as the value:
          assign it to a variable
          add it to a new array
      iterate through the remaining elements from last to first, and for each:
          instantiate a new Element object with the current value, and the last Element in the 
          `next` feild.
          reassign the temp variable to the new Element object
          add the Element object to the front of the array
      Finally, return a new list object with the objects array as an argument.

  - has an instance method called to_a, which returns an array object containing the values of the 
  elements in the list
  - has an instance method called reverse, which reverse the list. 
        get the array of values, reverse it, and then
=end

class SimpleLinkedList
  def self.from_a(arr)
    return new if arr == nil || arr.empty?

    arr = arr.dup
    element = Element.new(arr.pop)
    elements_arr = [element]

    until arr.empty?
      element = Element.new(arr.pop, element)
      elements_arr.unshift(element)
    end

    new(list: elements_arr)
  end

  attr_reader :list

  def initialize(list: [])
    @list = list
  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end

  def to_a
    list.map(&:datum)
  end

  def pop
    empty? ? nil : list.shift.datum
  end

  def head
    empty? ? nil : list[0]
  end

  def peek
    emplty? ? nil : list[0].datum
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  def push(value)
    top_el = list[0]
    element = Element.new(value, top_el)
    list.unshift(element)
  end
end

class Element
  def initialize(value, succ=nil)
    @value = value
    @succ = succ
  end

  def datum
    @value
  end

  def tail?
    @succ == nil
  end

  def next
    @succ
  end
end