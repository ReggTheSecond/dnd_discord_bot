require_relative 'currency.rb'
class Item
  attr_accessor :currency
  attr_accessor :item_name
  attr_accessor :item_type
  attr_accessor :item_decription
  attr_accessor :cost
  attr_accessor :weight
  attr_accessor :magical

  def initialize()
    @currency = Currency.new()
  end

  def to_string()
    return "Item Name: #{@item_name}\nItem Type: #{item_type}\nItem Decription: #{item_decription}\nCost: #{@currency.convert_to(@cost)}\nWeight: #{@weight}\nMagical?: #{@magical}"
  end
end
