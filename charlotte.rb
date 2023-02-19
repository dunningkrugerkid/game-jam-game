class Charlotte < Entity
#credit to charlotte for the display string
    @@display_string = "
     /L/\\
    |0 0 7
    | V  |
     WWWW
     L  L 
      "

    def initialize()
        super("Charlotte")
        set_description("What would you do if I was a goblin?")
        set_display(@@display_string)
        set_short_display("G")
    end

end