require 'time' # you're gonna need it

class Bar

attr_accessor :name, :menu_items, :price, :happy_discount

  def initialize(name)
    @name = name
    @menu_items = []
    @happy_discount = 0
end

def add_menu_item(item, price)
  @menu_items << menu_items
  # new_item = MenuItem.new(item, price)
  # @menu_items << new_item
end

def happy_hour?
  if Time.now > Time.parse("3pm") && Time.now < Time.parse("4pm")
   false
  else
   true
end
end

def happy_discount
 # happy_hour? ? 0.5 : 0
 if happy_hour? == true
    @happy_discount
  else
    0
  end
end

def happy_discount=(new_happy_discount)

end
end
