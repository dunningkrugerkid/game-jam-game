class Skeleton < Entity
    #credit to charlotte for the display string
        @@display_string = "
         .-.
        (o.o)
         |=|
        __|__
      //.=|=.\\\\
     // .=|=. \\\\
     \\\\ .=|=. //
      \\\\(_=_)//
       (:| |:)
        || ||
        () ()
        || ||
        || ||
       ==' '==
          "
    
        def initialize()
            super("Skeleton")
            @health = 90
            set_description("Got milk?")
            set_display(@@display_string)
            set_short_display("Z")
        end
    
    end