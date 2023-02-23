require_relative "entity"
class CaveLizard < Entity
        @@display_string = "
        

       __  ,
      (' \\ \
       \\ \\\\/ 
     '\\/\\ \\\\
         \\ \\\\/\\,
          \\ \\\\
          /\\ \\\\
          \\ `\\\\\\
          '   `\\\\
           \\\\
                 \\\\
                  \\\\    ,
                   `---'  
          "
    
        def initialize()
            super("Cave Lizard")
            @health = 75
            set_description("A slippery (and very angry) denizen of the deep.")
            set_display(@@display_string)
            set_short_display("L")
        end
    
    end

