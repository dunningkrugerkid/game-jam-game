require_relative "game"

def main()
    game = Game.new()
    game.play
end

if __FILE__ == $0   
    main()
end