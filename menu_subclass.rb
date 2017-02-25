# Hey Hey Cafe Menu
# David Mollert

require_relative "menu_class"

class Breakfast < Menu
  attr_accessor :selection, :cost

  def initialize
    @selection = ["2 Eggs and Bacon", "Sausage Gravy Biscuits", "Stack of Pancakes", "Cheese Grits", "Country Ham", "I\'ll Pass"]
    @cost = [3.95, 3.95, 2.75, 1.95, 3.59,]
  end
end

class BreakfastBeverage < Menu
  attr_accessor :selection, :cost

  def initialize
    @selection = ["Orange Juice-Small", "Orange Juice-Large", "Tomato Juice-Small", "Tomato Juice-Large", "Hot Tea", "Coffee", "Water", "I\'ll Pass"]
    @cost = [1.69, 2.49, 1.69, 2.49, 1.95, 1.95, 0.0]
  end
end

class Lunch < Menu
  attr_accessor :selection, :cost

  def initialize
    @selection = ["Chef's Salad", "Fish Tacos (2)", "Pizza", "Shrimp Salad Sandwich", "Ruben Sandwich", "I\'ll Pass"]
    @cost = [4.95, 6.95, 5.95, 8.95, 7.95]
  end
end

class LunchSides < Menu
  attr_accessor :selection

  def initialize
    @selection = ["Baked Beans", "Corn", "Pinto Beans", "Wild Rice", "Potato Salad", "I\'ll Pass"]
  end
end

class LDBeverage < Menu
  attr_accessor :selection, :cost

  def initialize
    @selection = ["Soda", "Tea", "Coffee", "Lemonade", "Root Beer", "Water", "I\'ll Pass"]
    @cost = [1.95, 1.95, 1.95, 2.25, 3.35, 0.0]
  end
end

class Dinner < Menu
  attr_accessor :selection, :cost

  def initialize
    @selection = ["Steak", "Shrimp", "Pork Chop", "Baby Back Ribs", "Vegetable Lasagna", "I\'ll Pass"]
    @cost = [10.95, 10.95, 8.95, 12.95, 7.95]
  end
end

class Dessert < Menu
  attr_accessor :selection, :cost

  def initialize
    @selection = ["Coconut Cream Pie", "Chocolate Chess Pie", "Pound Cake", "Apple Crisp", "I\'ll Pass"]
    @cost = [5.95, 5.95, 4.95, 4.95]
  end
end
