require 'date'

class TimeAgo
  class << TimeAgo
    def right_now
      time = Time.new
    	time.strftime("%I:%M:%S %p")
    end

    def readable(time)

      rightnow = Time.new
      backthen = time

      delta_setting = (rightnow.to_i - backthen.to_i).floor / 60
    
      distance = distance_of_time_in_words(delta_setting)
      return "#{distance} ago"
    end
	
    def distance_of_time_in_words(minutes)
      case
      when minutes < 0.4
        "a few seconds"
      when minutes < 0.6
        "half a minute"
      when minutes < 1
        "less than a minute"
      when minutes < 2
        "one minute"
      when minutes < 45
        "#{minutes} minutes"
      when minutes < 59
        "less than one hour"
      when minutes < 120
        "one hour"
      when minutes < 1080
        "#{(minutes / 60).round} hours"
      when minutes < 2880
        "yesterday"
      when minutes < 8640
        "#{(minutes / 1440).round} days"
      when minutes < 10080
        "one week"
      when minutes < 40320
        "#{(minutes / 8640).round} weeks"
      when minutes < 43200
        "one month"
      when minutes < 525580
        "#{(minutes / 43200).round} months"
      when minutes < 525600
        "one year"
      when minutes < 2628000
        "#{(minutes / 525600).round} years"
      else
        "#{minutes} minutes"
      end
    end

  end
end