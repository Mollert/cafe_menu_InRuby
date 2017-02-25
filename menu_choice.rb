# Hey Hey Cafe Menu
# David Mollert

require_relative "menu_class"
require_relative "menu_subclass"

main_menu = Menu.new
main_menu.introduction
print "What time is it (hour only)? "
hour = gets.chomp.to_i
until 0 < hour && hour < 13 do
  puts "You must have typed in an incorrect hour of the day.  Please try again."
  hour = gets.chomp.to_i
end
print "How about AM or PM? "
ampm = gets.chomp.upcase
until ampm == "AM" || ampm == "PM" do
  puts "You must have typed something other than AM or PM.  Please try again."
  ampm = gets.chomp.upcase
end
offering = 0
offering = main_menu.time(hour, ampm, offering)
take_order = Array.new
if offering == 1
  take_order = main_menu.breakfast_order(take_order, 6, 8)
elsif offering == 2
  take_order = main_menu.lunch_order(take_order, 6, 6, 7)
elsif offering == 3
  take_order = main_menu.dinner_order(take_order, 6, 7, 5)
end
if offering == 1 || offering == 2 || offering == 3
  tab = main_menu.tally_the_order(take_order)
  tab_rounded = "%.2f" % tab
  puts "Your bill comes to $#{tab_rounded}.  Do you want to add a tip?  Type \"y\" or \"n\"."
  want_tip = gets.chomp.upcase
  if want_tip == "Y"
    puts "If you want to leave a fixed amount type ($x.xx) or for a percentage type a \"%\" and I will figure it for you."
    tip_type = gets.chomp
    if tip_type == "%"
      puts "What percentage do you want me to use for your tip (xx.x)?"
      tip_pct = gets.chomp
      take_order.push("Tip Amount (at #{tip_pct}%)")
      tip_pct = tip_pct.to_f
      tip_amt = tab * (tip_pct/100)
      tab = tab + tip_amt
      tip_amt_show = "%.2f" % tip_amt
      take_order.push(tip_amt_show)
    else
      take_order.push("Tip Amount (at $#{tip_type})")
      tip_type = tip_type.to_f
      tab = tab + tip_type
      tip_type_show = "%.2f" % tip_type
      take_order.push(tip_type_show)
    end
  end
  tab_show = "%.2f" % tab
  final_bill = main_menu.display_final_tally(offering, take_order, tab_show)
end
