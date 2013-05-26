require 'date'

class Calendar
  
  def initialize(year, month)
    @month = Date.new(year, month).strftime("%b")
    @year = year
    @week = 'Su Mo Tu We Th Fr St'
    @month_start = Date.new(year, month, 1)
    @days = Array(1..Date.new(year, month, -1).day)
  end

  def render
    title = "#{@month}\s#{@year}" 
    title_blank = (21 - title.size) / 2
    week_line = "#{@week}"
    if @month_start.sunday?
      blank = 0
    else
      blank = @month_start.cwday * 3
    end    
    output = "\s" * title_blank + "#{title}\n#{week_line}\n" + "\s" * blank
    @days.each do |day|
      ret =  @month_start.cwday + (day - 1)
      if ret%7 == 6
        output += "#{day.to_s.rjust(2)}\n"
      else
        output += "#{day.to_s.rjust(2)}\s"
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
