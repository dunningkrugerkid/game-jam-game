class Bandit < Entity
  @@display_string = Art.instance.bandit

  def initialize()
    super("Bandit")
    @health = 100
    set_description("He wants your coin.")
    set_display(@@display_string)
    set_short_display("B")
  end
end
