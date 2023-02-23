require_relative "floor"
require_relative "treasure"
require_relative "end"
require_relative "player"

class Game

    def initialize()
        @floor = Floor.new()
        @valid_directions = ["north", "south", "east", "west"]
        @valid_actions = ["attack", "potion", "spell"]
        @attack_array = ["swung", "beat", "slapped", "carefully insulted", "stabbed", "bit", "scratched", "read Vogon poetry", "screamed until glass broke", "mashed", "moped", "flashed shiny teeth"]
    end

    def play()
        cont = true
        play_intro()
        while cont
            @floor.get_current_room.display
            @floor.get_current_room.describe
            puts("\nEnter a command:\n")
            user_input = $stdin.gets.chomp.downcase
                
            if(@valid_directions.include? user_input)
                @floor.go(user_input)
            elsif(user_input == "quit")
                exit
            else(puts "I'm not gonna guess! Enter a valid command.")
                sleep(2)
                system "clear"
                system "cls"
                next
            end

            if @floor.get_current_room.get_enemy != nil
                begin_combat(@floor.get_player, @floor.get_current_room.get_enemy)
                if(@floor.get_player.get_health <= 0)
                    puts("YOU DIED!")
                    cont = false
                else
                    @floor.get_current_room.set_enemy(nil)
                    @floor.get_current_room.set_encounter(Treasure.new())
                    @floor.get_current_room.display()
                end
            end

            if !@floor.get_current_room.get_encounter.is_a?Empty
                sleep(1)
                system "clear"
                system "cls"
            end

            if(!@floor.get_current_room.get_encounter.is_a?Empty)
                if(@floor.get_current_room.get_encounter.is_a?End)
                    cont = false
                end
                @floor.get_current_room.get_encounter.encounter(@floor.get_player)
                @floor.get_current_room.set_encounter(Empty.new())
                sleep(3)
            end
            system "clear"
            system "cls"
        end
    end

    def begin_combat(player, enemy)
        system "clear"
        system "cls"
        enemy.overall_status

        while (player.get_health > 0) && (enemy.get_health > 0)
            puts("You have " + player.get_health.to_s + "HP and " + player.get_mana.to_s + " MP.")
            puts("actions: potion/attack/spell")
            user_input = $stdin.gets.chomp.downcase

            if(@valid_actions.include? user_input)
                take_action(user_input, player, enemy)
            end
            dmg = rand(1..15)
            puts("\n" +enemy.get_name + " " + @attack_array.sample + " for " + dmg.to_s + " damage!")
            player.damage(dmg)
            puts("You have " + player.get_health.to_s + " health remaining!")
        end

        if(enemy.get_health <= 0)
            puts("Defeated " + enemy.get_name + "!")
            player.add_mana(5)
        end
        sleep(1)
        system "clear"
        system "cls"
    end

    def take_action(user_input, player, enemy)

        if(user_input == "potion")
            if(player.get_potions > 0)
                puts("You healed for 25!")
                player.heal(25)
                player.change_potions(-1)
                puts(player.get_potions.to_s + " potions remaining!")
            else
                puts("You attempt to drink the empty potion!\nIt tastes like air.")
            end
        elsif(user_input == "attack")
            dmg = rand(15..25)
            puts("\nYou " + @attack_array.sample + " for " + dmg.to_s + " damage!")
            enemy.damage(dmg)
            puts(enemy.get_name + " has " + enemy.get_health.to_s + " health remaining!")
        else
            if(player.get_mana >= 5)
                dmg = rand(10..50)
                puts("\nYou perform ancient runic magic. Your foe is wounded for " + dmg.to_s + " damage!")
                enemy.damage(dmg)
                puts(enemy.get_name + " has " + enemy.get_health.to_s + " health remaining!")
                player.remove_mana(5)
                puts(player.get_potions.to_s + " potions remaining!")
            else
                puts("Not enough MP!")
                puts("You perform a parlor trick! Your opponent is very impressed, but they'll keep attacking.")
            end
        end
    end

    def play_intro()

        puts " 
    ____ ___             __            __     /\\           ________                                __   
    |    |   \\ _______  |__|   ______ _/  |_  )/   ______  \\_____  \\    __ __    ____     ______ _/  |_ 
    |    |   / \\_  __ \\ |  |  /  ___/ \\   __\\     /  ___/   /  / \\  \\  |  |  \\ _/ __ \\   /  ___/ \\   __\\
    |    |  /   |  | \\/ |  |  \\___ \\   |  |       \\___ \\   /   \\_/.  \\ |  |  / \\  ___/   \\___ \\   |  |  
    |______/    |__|    |__| /____  >  |__|      /____  >  \\_____\\ \\_/ |____/   \\___  > /____  >  |__|  
                                  \\/                  \\/          \\__>              \\/       \\/         "

        puts "\n\n\nYou are Urist, a dwarf of great adventuring repute. For years you have dreamed of returning to your people's old home, long-since claimed by the denizens of the deep.\nThe journey so far has been long and taxing, but nothing compared to the challenge that lies before you..."
        sleep(10)
        system "clear"
        system "cls"
        puts "You descend ever deeper..."
        sleep(2)
        system "clear"
        system "cls"

    end

end

