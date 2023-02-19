require_relative "entity"

class Spider < Entity
    
    @@display_string = "
      |
      | 
     _| 
///\(o_o)/\\\\\\
|||  ` '  |||"

    def initialize()
        super("Cave Spider")
        set_description("Doesn't want you in her parlor.")
        set_display(@@display_string)
        set_short_display("S")
    end

end