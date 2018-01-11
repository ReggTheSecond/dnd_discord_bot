class Currency
  attr_accessor :value_of_gold
  attr_accessor :value_of_silver
  def initialize
    @value_of_gold = 100
    @value_of_silver = 10
  end

  def convert_to(copper)
    if copper >= 100
      return convert_to_gold(copper)
    elsif copper >= 10
      return convert_to_silver(copper)
    else
      return "#{copper}cp"
    end
  end

  def convert_to_silver(copper )
    silver = 0
    while copper >= 10
      silver += 1
      copper += -10
    end
    return "#{silver}sp, #{copper}cp"
  end

  def convert_to_gold(copper )
    gold = 0
    while copper >= 100
      gold += 1
      copper += -100
    end
    silver_copper = convert_to_silver(copper)
    return "#{gold}gp, #{silver_copper}sp"
  end
end
