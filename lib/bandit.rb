require_relative "entity"
class Bandit < Entity
        @@display_string = "
        
          .-.           
        __|=|__         
       (_/`-`\\_)        
       //\\___/\\\\        
       <>/   \\<>        
        \\|_._|/          
         <_I_>           
          |||            
         /_|_\\
    
          "
    
        def initialize()
            super("Bandit")
            @health = 100
            set_description("He wants your coin.")
            set_display(@@display_string)
            set_short_display("B")
        end
    
    end