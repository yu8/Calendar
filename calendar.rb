require 'date'

class Calender
  
  def initialize(year, month)
    @month = Date.new(year, month).strftime("%b")
    @year = Date.new(year, month).year
    @week = 'Su Mo Tu We Th Fr St'
    @month_end = Date.new(year, month, -1).day
    @month_start = Date.new(year, month, 1)
    @days = Array(1..@month_end)
  end

  def render
    month_line = "#{@month}\s#{@year}" 
    month_line_blank = (21 - month_line.size) / 2
    week_line = "#{@week}"
    if @month_start.cwday == 7
      blank = 0
    else
      blank = @month_start.cwday * 3
    end    
    @output = "\s" * month_line_blank + "#{month_line}\n#{week_line}\n" + "\s" * blank
    @days.each do |day|
      ret =  @month_start.cwday + (day - 1)
      if ret%7 == 6
        @output += "#{day.to_s.rjust(2)}\n"
      else
        @output += "#{day.to_s.rjust(2)}\s"
      end 
    end
    puts @output
    
  end

end

(1..12).each do |month|
  calendar = Calender.new(2013, month)
  calendar.render
  puts "----------------------------\n\n"
end
