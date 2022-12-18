require 'date'
require 'optparse'

def print_calendar(year, month)
  puts '   ' + Date.new(year, month).strftime('%B %Y')
  puts 'Su Mo Tu We Th Fr Sa'

  first_wday = Date.new(year, month, 1).wday
  last_day = Date.new(year, month, -1).day

  day = 1
  space_count = 0
  output_count = 0
  while day <= last_day do
    # wdayメソッドの返り値と1日の左側に入れたい空白の数が一致する
    if space_count < first_wday
      print ' '.rjust(2)
      space_count += 1
    else
      print day.to_s.rjust(2)
      day += 1
    end

    output_count += 1
    if output_count % 7 == 0
      print "\n"
    else
      print ' '
    end
  end
  print "\n" if output_count % 7 != 0
end

def exec
  opt = OptionParser.new
  opt.on('-y')
  opt.on('-m')
  opt.parse!(ARGV)

  if ARGV.size == 0
    today = Date.today
    month = today.month
    year = today.year
  else
    year = ARGV[0].to_i
    month = ARGV[1].to_i
  end

  print_calendar(year, month)
end

exec
