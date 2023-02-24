class Encounter
  def initialize(name)
    @gold_value = nil
    @description = nil
    @short_display = nil
    @display = nil
  end

  def describe()
    puts @description
  end

  def get_short_display()
    return @short_display
  end

  def display()
    puts @display
  end

  def encounter(player)
    puts "shouldn't be seen"
  end
end
