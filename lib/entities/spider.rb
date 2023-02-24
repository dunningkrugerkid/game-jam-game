class Spider < Entity
  @@display_string = "
      |
      |
     _|
///\(o_o)/\\\\\\
|||  ` '  |||"

  def initialize()
    super("Cave Spider")
    @health = 50
    set_description("Doesn't want you in her parlor.")
    set_display(@@display_string)
    set_short_display("S")
  end
end
