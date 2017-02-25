# Hey Hey Cafe Menu
# David Mollert

class Menu

  attr_accessor :am, :pm

  def initialize
    @@am = "AM"
    @@pm = "PM"
  end

  def introduction
    lineWidth = 44
    puts "\n"
    puts "======================".center(lineWidth)
    puts "GREAT TO SEE YOU".center(lineWidth)
    puts "-  at the  -".center(lineWidth)
    puts "====   HEY HEY CAFE   ====".center(lineWidth)
    puts "\n"
  end

  def time(hour_minute, am_pm, bldclosed)
    if hour_minute >= 6 && hour_minute < 11 && am_pm == @@am
      puts "\n"
      puts "We are serving Breakast until 11.", p
      puts "Our Offerings are listed below:", p
      morning_menu = Breakfast.new
      morning_menu.display_menu_wc
      puts "\n"
      puts "Beverages:", p
      breakfast_beverage_menu = BreakfastBeverage.new
      breakfast_beverage_menu.display_menu_wc
      puts "\n"
      bldclosed = 1
    elsif hour_minute == 11 && am_pm == @@am || hour_minute == 12 && am_pm == @@pm || hour_minute < 5 && am_pm == @@pm
      puts "\n"
      puts "We are serving Lunch until 5.", p
      puts "Our Offerings are listed below:", p
      lunch_menu = Lunch.new
      lunch_menu.display_menu_wc
      puts "\n"
      puts "Sides listed are $1.25ea.", p
      lunch_sides_menu = LunchSides.new
      lunch_sides_menu.display_menu_woc
      puts "\n"
      puts "Beverages:", p
      ld_beverage_menu = LDBeverage.new
      ld_beverage_menu.display_menu_wc
      puts "\n"
      bldclosed = 2
    elsif hour_minute >= 5 && hour_minute <= 11 && am_pm == @@pm
      puts "\n"
      puts "We are serving Dinner until 11.", p
      puts "Our Offerings are listed below.", p
      dinner_menu = Dinner.new
      dinner_menu.display_menu_wc
      puts "\n"
      puts "Beverages:", p
      ld_beverage_menu = LDBeverage.new
      ld_beverage_menu.display_menu_wc
      puts "\n"
      puts "If you would like a dessert, choose from the menu below:", p
      dessert_menu = Dessert.new
      dessert_menu.display_menu_wc
      puts "\n"
      bldclosed = 3
    else
      puts "\n"
      puts "Our hours are from 6AM to 11PM.  Check back then.", p
    end
    return bldclosed
  end

  def display_menu_wc
     selectionl = @selection.length
     selectionl -= 1
     costl = @cost.length
     if selectionl == costl
       lineWidth = 54
       i = 0
       while i < selectionl do
         puts " #{i+1}. #{selection[i]}:".ljust(lineWidth/2) + "$#{cost[i]}          ".rjust(lineWidth/2)
         i += 1
       end
       puts " #{i+1}. #{selection[i]}:".ljust(lineWidth/2)
     else
       puts "This menu has issues and should be addressed."
     end
   end

   def display_menu_woc
      selectionl = @selection.length
      lineWidth = 54
      i = 0
      while i < selectionl do
        puts " #{i+1}. #{selection[i]}"
        i += 1
      end
    end

  def breakfast_order(order, bhigh, bbhigh)
    puts "Type in your first selection, item number 1 through 6."
    choice = gets.chomp.to_i
    choice = check_entry(bhigh, choice)
    morning_order = Breakfast.new
    if 0 < choice && bhigh > choice
      translate = morning_order.selection[choice-1]
      order.push(translate)
      translate = morning_order.cost[choice-1]
      order.push(translate)
    end
    puts "Now type in your first beverage selection, item number 1 through 8."
    choice = gets.chomp.to_i
    choice = check_entry(bbhigh, choice)
    morning_beverage_order = BreakfastBeverage.new
    if 0 < choice && bbhigh > choice
      translate = morning_beverage_order.selection[choice-1]
      order.push(translate)
      translate = morning_beverage_order.cost[choice-1]
      order.push(translate)
    end
    puts "Can I take another order?  Type either yes \"y\" or no \"n\"."
    another = gets.chomp.upcase
    while another == "Y" do
      puts "Type in your next menu selection."
      choice = gets.chomp.to_i
      if 0 < choice && bhigh > choice
        translate = morning_order.selection[choice-1]
        order.push(translate)
        translate = morning_order.cost[choice-1]
        order.push(translate)
      end
      puts "Now for a beverage."
      choice = gets.chomp.to_i
      choice = check_entry(bbhigh, choice)
      if 0 < choice && bbhigh > choice
        translate = morning_beverage_order.selection[choice-1]
        order.push(translate)
        translate = morning_beverage_order.cost[choice-1]
        order.push(translate)
      end
      puts "Would you like another order?  Type either yes \"y\" or no \"n\"."
      another = gets.chomp.upcase
    end
    return order
  end

  def lunch_order(order, lhigh, shigh, lbhigh)
    puts "Type in your first selection, item number 1 through 6."
    choice = gets.chomp.to_i
    choice = check_entry(lhigh, choice)
    afternoon_order = Lunch.new
    if 0 < choice && lhigh > choice
      translate = afternoon_order.selection[choice-1]
      order.push(translate)
      translate = afternoon_order.cost[choice-1]
      order.push(translate)
    end
    puts "Now a side with that?  They are $2.95 each."
    choice = gets.chomp.to_i
    choice = check_entry(shigh, choice)
    afternoon_side_order = LunchSides.new
    if 0 < choice && shigh > choice
      translate = afternoon_side_order.selection[choice-1]
      order.push(translate)
      order.push(2.95)
    end
    puts "Now type in your first beverage selection, item number 1 through 7."
    choice = gets.chomp.to_i
    choice = check_entry(lbhigh, choice)
    afternoon_beverage_order = LDBeverage.new
    if 0 < choice && lbhigh > choice
      translate = afternoon_beverage_order.selection[choice-1]
      order.push(translate)
      translate = afternoon_beverage_order.cost[choice-1]
      order.push(translate)
    end
    puts "Can I take another order?  Type either yes \"y\" or no \"n\"."
    another = gets.chomp.upcase
    while another == "Y" do
      puts "Type in your next menu selection."
      choice = gets.chomp.to_i
      if 0 < choice && lhigh > choice
        translate = afternoon_order.selection[choice-1]
        order.push(translate)
        translate = afternoon_order.cost[choice-1]
        order.push(translate)
      end
      puts "And a side."
      choice = gets.chomp.to_i
      choice = check_entry(shigh, choice)
      if 0 < choice && shigh > choice
        translate = afternoon_side_order.selection[choice-1]
        order.push(translate)
        order.push(2.95)
      end
      puts "Now for a beverage."
      choice = gets.chomp.to_i
      choice = check_entry(lbhigh, choice)
      if 0 < choice && lbhigh > choice
        translate = afternoon_beverage_order.selection[choice-1]
        order.push(translate)
        translate = afternoon_beverage_order.cost[choice-1]
        order.push(translate)
      end
      puts "Would you like another order?  Type either yes \"y\" or no \"n\"."
      another = gets.chomp.upcase
    end
    return order
  end

  def dinner_order(order, drhigh, lbhigh, dthigh)
    puts "Type in your first selection, item number 1 through 6."
    choice = gets.chomp.to_i
    choice = check_entry(drhigh, choice)
    evening_order = Dinner.new
    if 0 < choice && drhigh > choice
      translate = evening_order.selection[choice-1]
      order.push(translate)
      translate = evening_order.cost[choice-1]
      order.push(translate)
    end
    puts "Now type in your first beverage selection, item number 1 through 7."
    choice = gets.chomp.to_i
    choice = check_entry(lbhigh, choice)
    evening_beverage_order = LDBeverage.new
    if 0 < choice && lbhigh > choice
      translate = evening_beverage_order.selection[choice-1]
      order.push(translate)
      translate = evening_beverage_order.cost[choice-1]
      order.push(translate)
    end
    puts "How about some dessert with that?  Type in itme number 1 through 5."
    choice = gets.chomp.to_i
    choice = check_entry(dthigh, choice)
    evening_dessert_order = Dessert.new
    if 0 < choice && dthigh > choice
      translate = evening_dessert_order.selection[choice-1]
      order.push(translate)
      translate = evening_dessert_order.cost[choice-1]
      order.push(translate)
    end
    puts "Can I take another order?  Type either yes \"y\" or no \"n\"."
    another = gets.chomp.upcase
    while another == "Y" do
      puts "Type in your next menu selection."
      choice = gets.chomp.to_i
      if 0 < choice && drhigh > choice
        translate = evening_order.selection[choice-1]
        order.push(translate)
        translate = evening_order.cost[choice-1]
        order.push(translate)
      end
      puts "Now for a beverage."
      choice = gets.chomp.to_i
      choice = check_entry(lbhigh, choice)
      if 0 < choice && lbhigh > choice
        translate = evening_beverage_order.selection[choice-1]
        order.push(translate)
        translate = evening_beverage_order.cost[choice-1]
        order.push(translate)
      end
      puts "And a dessert."
      choice = gets.chomp.to_i
      choice = check_entry(dthigh, choice)
      if 0 < choice && dthigh > choice
        translate = evening_dessert_order.selection[choice-1]
        order.push(translate)
        translate = evening_dessert_order.cost[choice-1]
        order.push(translate)
      end
      puts "Would you like another order?  Type either yes \"y\" or no \"n\"."
      another = gets.chomp.upcase
    end
    return order
  end

  def check_entry(high, choice)
    until 0 < choice && high >= choice do
      puts "You must have typed something other than the offered selections.  Please try again."
      choice = gets.chomp.to_i
    end
    return choice
  end

  def tally_the_order(order)
    adder = 0
    i = 1
    lngth = order.length
    while lngth >= i do
      adder = adder + order[i]
      i += 2
    end
    return adder
  end

  def display_final_tally(bldclosed, order, tally)
    lineWidth = 44
    if bldclosed == 1
      meal = "Breakfast"
    elsif bldclosed == 2
      meal = "Lunch"
    else
      meal = "Dinner"
    end
    puts "\n"
    puts "We hope you enjoyed your #{meal}".center(lineWidth)
    puts "\n"
    puts "here at the".center(lineWidth)
    puts "\n"
    puts "====   HEY HEY CAFE   ====".center(lineWidth)
    puts "\n"
    puts "We look forward to seeing you again!".center(lineWidth)
    puts "\n"
    lineWidth = 54
    i = 0
    orderl = order.length
    while i < orderl do
      puts " #{order[i]}:".ljust(lineWidth/2) + "$#{order[i+1]}          ".rjust(lineWidth/2)
      i += 2
    end
    puts "=======          ".rjust(lineWidth)
    puts "Total: $#{tally}          ".rjust(lineWidth)
  end
end
