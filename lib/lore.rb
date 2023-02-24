require_relative "encounter"
class Lore < Encounter

    def initialize()
        @description = "You encounter some engraved dwarven runes. You can just barely glean their meaning, with much effort..."
        @short_display = "P"
        @display = "
        |    |\\   |      /|  |\\  |/
        |/   | |  |>     /|  |/  |
        |/   |    |       |  |\\  |


        \\|/     \\|   |   |   /   /|\\
           X       |   |   |   \    |
        /|\\      |\\  |  /|   /    |
         
        "
      @lore_list = ["Drums, drums, drums... that infernal drumming.",
    "Remember the fallen of Disi's expedition - 2786 B.A.D. Disi wrote this.",
  "These warrens were abandoned following Thorek's Southmarch.",
"Bofur stole my sweet roll. Dori wrote this.",
"The dead walk. I have never seen it before. Pray to the ancestors, pray to the forgotten-gods. Pray that they still listen.",
"An outcropping of diamonds was carved away here. They went to the Mountain-King.",
"This room was carved by Thimbur.",
"Trust not the tall-folk. When we have passed from these halls, they will swoop in as vultures and pick over our lost riches.",
"A skulking kobold stole an heirloom of mine. I'll have its head!"]

        
    end

    def encounter(player)
        puts(@display)
        puts("\n\n" + @description)
        puts(@lore_list.sample)
    end

end