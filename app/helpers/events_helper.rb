module EventsHelper
  def nice_time(time)    
    day = if time.at_beginning_of_day == Time.zone.now.at_beginning_of_day
      "Today"
    elsif time.at_beginning_of_day == (Time.zone.now.at_beginning_of_day - 1)
      "Yesterday"
    else
      time.to_s(:date)
    end

    "#{day} #{time.to_s(:time)}"
  end
end