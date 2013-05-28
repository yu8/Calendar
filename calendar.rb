require 'date'

class Calendar

  WEEK = 'Su Mo Tu We Th Fr St'

  def initialize(year, month)
    @month = Date.new(year, month).strftime("%b")
    @year = year
    @month_start = Date.new(year, month, 1)
    @days = Array(1..Date.new(year, month, -1).day)
  end

  def render
    title = "#{@month}\s#{@year}" 
    blank = @month_start.wday * 3
    output = "#{title.center(21)}\n#{WEEK}\n" + "\s" * blank
    @days.each do |day|
      ret =  @month_start.cwday + (day - 1)
      output += day.to_s.rjust(2)
      if ret%7 == 6
        output += "\n"
      else
        output += "\s"
      end 
    end
    output
  end

end

(1..12).each do |month|
  calendar = Calendar.new(2013, month)
  puts calendar.render
  puts "----------------------------\n\n"
end
