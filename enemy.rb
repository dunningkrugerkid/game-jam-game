require_relative "entity"

class Spider < Entity:

    def initialize(room, description):
        super("Cave Spider", room, description)
        set_description("Doesn't want you in its parlor.")
        set_display("
        | \n
        | \n
       _| \n
  ///\(o_o)/\\\ \n
  |||  ` '  ||| ")
    end

end