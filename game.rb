require_relative "floor"
require_relative "treasure"

class Game

    def initialize()
        @floor = Floor.new()
        @valid_directions = ["north", "south", "east", "west"]
        @valid_actions = ["attack", "potion"]
    end

    def play()
        cont = true
        while cont
            
            puts("Enter a command:\n")
            user_input = $stdin.gets.chomp.downcase
                
            if(@valid_directions.include? user_input)
                @floor.go(user_input)
            end

            if @floor.get_current_room.get_enemy != nil
                begin_combat(@floor.get_player, @floor.get_current_room.get_enemy)
                if(@floor.get_player.get_health <= 0)
                    puts("YOU DIED!")
                    cont = false
                end
                else
                    @floor.get_current_room.set_enemy(nil)
                    @floor.get_current_room.set_encounter(Treasure.new()) 
                end
            end

        end
    end

    def begin_combat(player, enemy)
        enemy.overall_status

        while (player.get_health > 0) && (enemy.get_health > 0)
            puts("potion or attack?")
            user_input = $stdin.gets.chomp.downcase

            if(@valid_actions.include? user_input)
                take_action(user_input, player, enemy)
            end
            dmg = rand(1..15)
            puts(enemy.get_name + " attacked for " + dmg.to_s + " damage!")
            player.damage(dmg)
            puts("You have " + player.get_health.to_s + " health remaining.")

        end

        if(enemy.get_health <= 0)
            puts("Defeated " + enemy.get_name + "!")
        end

    end

    def take_action(user_input, player, enemy)

        if(user_input == "potion")
            puts("healed for 25!")
            player.heal(25)
        elsif(user_input == "attack")
            dmg = rand(15..25)
            puts("You attacked for " + dmg.to_s + " damage!")
            enemy.damage(dmg)
            puts(enemy.get_name + " has " + enemy.get_health.to_s + " health remaining!")
        end



end