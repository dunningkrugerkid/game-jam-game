require_relative "encounter"
class Merchant < Encounter

    def initialize()
        @gold_value = rand(10..20)
        @description = "Even in these deep caverns, the allure of profit is too much for some to resist. A kobold merchant gestures wildly at their wares. You grin and bear the stench, for a time."
        @short_display = "K"
        @display = "
             
        \\  |  /
        | o o |
        |  v  |
        |  W  |
         \\ _ /
"
    end

    def encounter(player)
        puts(@display)
        puts("\n\n" + @description)
        cost1 = rand(10..15)
        cost2 = rand(10..20)
        puts("You have " + player.get_gold.to_s + " gold.\n A health potion costs " + cost1.to_s + " gold.\n An attack upgrade costs " + cost2.to_s + " gold.\n")
        puts("Enter health/attack/quit to buy or leave.")
        user_input = $stdin.gets.chomp

        while(user_input != "q")
            if user_input == "health" && player.get_gold >= cost1
                player.change_gold((0 - cost1))
                puts("Bought a health potion!")
                player.change_potions(1)
            elsif user_input == "potion" && player.get_gold >= cost2
                player.change_gold((0-cost2))
                puts("Your blade looks sharper!")
                player.change_attack_bonus(2)
            else
                puts("The kobold looks at you angrily and mutters. You can't understand it, but you think you get the gist.")
            end
            user_input = $stdin.gets.chomp
        end
        puts('The kobold holds up a sign. It says "fank u 4 ur patrinige!" ')
    end


end