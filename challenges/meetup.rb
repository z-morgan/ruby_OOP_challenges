=begin
Objects of the Meetup class are instantiated with a year and a month. 

the constructor creates a new date object, the first day of the given month/year

day method:
- get the number of days in the month
- create a nested array with the numbers as first el and the weekday as second el
- for the given descriptor, get the number for that day
    first-fifth, loop through the elements until you encounter the nth instance of the day
      for fifth, if there is not a fifth day, return nil
    teeth, return the instance with a number between 13 and 19
    last, return the number cooresponding to the last instance of that weekday
- reaturn a new Date object with that day




helper method to get the nested array:
  loop through the days in the month using hte Date#next_day method, until the month is no longer
  the same number: for each day
    add an element to the array with: the current day number, and the current day of the week
        to get the current day of the week, use a helper method that takes the day number and the date object:
          determines which day? method returns true and returns that day.
  return the array

1-5 helper method:
  set the integer to target, and iterate through the array
    each time the second element is the downcased-weekday, increment a counter
    if the counter is the same as target, return the first element of teh current sub-array
  if the method does not return during the iterations, return nil

for the body of day method:
  assigned the return value of helper method to a variable
  create an array with the possible discripters: [teeth, first-fift, last]
  get the index of the correct descripter
  create three helper methods, 
    for idx 0, teeth method that takes the base array and the weekday and returns an integer
    for idx 1-5, method that takes the base array and the weekday and the index and returns an integer
    for idx 6, last method that takes the array and the weekday returns an integer
  
  if the integer is actually nil, return nil
  use the returned integer to return a new date object on that day of the month.

=end

require 'date'

class Meetup
  OPTIONS = ['teenth', 'first', 'second', 'third', 'fourth', 'fifth', 'last'].freeze

  def basic_day
    @basic_day.dup
  end

  def initialize(year, month)
    @basic_day = Date.new(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    weekday = weekday.downcase
    idx = OPTIONS.index(schedule.downcase)

    day_of_month = case idx
                   when 0 then teenth_day(weekday)
                   when (1..5) then n_th_day(weekday, idx)
                   when 6 then last_day(weekday)
                   end
    day_of_month ? Date.new(@year, @month, day_of_month) : nil
  end

  def teenth_day(weekday)
    get_base_arr.find do |sub_arr|
      (13..19).include?(sub_arr[0]) && sub_arr[1] == weekday
    end.first
  end

  def n_th_day(weekday, nth)
    counter = 0
    get_base_arr.each do |sub_arr|
      counter += 1 if sub_arr[1] == weekday
      return sub_arr[0] if counter == nth
    end
    nil
  end

  def last_day(weekday)
    get_base_arr.reverse.find { |sub_arr| sub_arr[1] == weekday }.first
  end

  def get_base_arr
    base_arr = []
    this_month = basic_day
    
    until this_month.month != basic_day.month
      base_arr << [this_month.day, weekday_finder(this_month)]
      this_month = this_month.next
    end

    base_arr
  end

  def weekday_finder(date_obj)
    if date_obj.monday?
      'monday'
    elsif date_obj.tuesday?
      'tuesday'
    elsif date_obj.wednesday?
      'wednesday'
    elsif date_obj.thursday?
      'thursday'
    elsif date_obj.friday?
      'friday'
    elsif date_obj.saturday?
      'saturday'
    elsif date_obj.sunday?
      'sunday'
    end
  end
end
