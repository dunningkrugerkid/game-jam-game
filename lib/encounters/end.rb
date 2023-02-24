class End < Encounter
  def initialize()
    @description = "A way out?"
    @short_display = "U"
    @display = Art.instance.ladder
  end

  def encounter(player)
    puts("The end of the road - but the caverns still call...")
    puts("THANK YOU FOR PLAYING!")
    sleep(5)
    exit
  end
end
