=begin
write a class called 'Clock' that represents the time.
class methods:
  - at - instantiates a new Clock object, and takes an integer that sets the hour to that integer, and optionally takes a second
      integer, that sets the minutes to that integer. test cases do not test invalid input
instance methods:
  - to_s, returns a string, describing the state of the Clock in typical 24 hour format
  - + method - takes an integer, and adds integer number of minutes to the Clock
  - - method - takes an integer, and subtracts integer number of minutes from the Clock
  - == method, which returns true if two Clock classes have the same time

-- for the + and - methods, if the change in time would go over 24 hours or under 0 ours, reset to next
day

D: integer representing total minutes

=end

class Clock
  MIN_PER_HOUR = 60
  MIN_PER_DAY = 1440

  def self.at(hr, min=0)
    new(hr, min)
  end

  def initialize(hr, min)
    @minutes = (hr * MIN_PER_HOUR) + min
  end

  # def to_s
  #   hour, minute = minutes.divmod(MIN_PER_HOUR)
  #   hour = hour.to_s
  #   minute = minute.to_s
  #   hour = '0' + hour if hour.size < 2
  #   minute = '0' + minute if minute.size < 2

  #   hour + ":" + minute
  # end

  def to_s
    hour, minute = minutes.divmod(MIN_PER_HOUR)
    "#{format("%02d", hour)}:#{format("%02d", minute)}"
  end

  def +(min)
    new_min = minutes + min
    new_min = new_min - MIN_PER_DAY until new_min < MIN_PER_DAY
    Clock.at(*new_min.divmod(MIN_PER_DAY))
  end

  def -(min)
    new_min = minutes - min
    new_min = new_min + MIN_PER_DAY until new_min >= 0
    Clock.at(*new_min.divmod(MIN_PER_DAY))
  end

  def ==(other_clock)
    minutes == other_clock.minutes
  end

  protected

  attr_accessor :minutes
end
