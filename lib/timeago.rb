require 'date'

module TimeAgo
  def relative_time
    raise "This isn't a Time like class. I can't calculate the relative time" unless respond_to? :to_time
    rightnow = Time.new
    backthen = to_time

    delta_setting = (rightnow.to_i - backthen.to_i).floor
  
    distance = distance_of_time_in_words(delta_setting)
  end

private

  def distance_of_time_in_words(seconds)
    case
    when seconds < 25.seconds
      "a few seconds ago"
    when seconds < 31.seconds
      "half a minute ago"
    when seconds < 1.minute
      "less than a minute ago"
    when seconds < 2.minutes
      "one minute ago"
    when seconds < 45.minutes
      "#{seconds/1.minute} minutes ago"
    when seconds < 59.minutes
      "less than one hour ago"
    when seconds < 120.minutes
      "one hour ago"
    when seconds < 18.hours
      "#{(seconds / 1.hour).round} hours ago"
    when seconds < 48.hours
      "yesterday"
    when seconds < 6.days
      "#{(seconds / 1.day).round} days ago"
    when seconds < 1.week
      "one week ago"
    when seconds < 28.days
      "#{(seconds / 1.week).round} weeks ago"
    when seconds < 30.days
      "one month ago"
    when seconds < 364.days
      "#{(seconds / 1.month).round} months ago"
    when seconds <= 365.days
      "one year ago"
    when seconds < 5.years
      "#{(seconds / 1.year).round} years ago"
    else
      "#{seconds / 1.minute} minutes ago"
    end
  end

end

class Time
  include TimeAgo
end

if Object.const_defined? :ActiveSupport
  module ActiveSupport
    class TimeWithZone
      include TimeAgo
    end
  end
end
