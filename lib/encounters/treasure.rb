class Treasure < Encounter
  def initialize()
    @gold_value = rand(10..20)
    @description = "The dwarves of yore made mighty spells... and also left piles of gold lying around."
    @short_display = "X"
    @display = "
             _.--.
        _.-'_:-'||
    _.-'_.-::::'||
_.-:'_.-::::::'  ||
.'`-.-:::::::'     ||
/.'`;|:::::::'      ||_
||   ||::::::'     _.;._'-._
||   ||:::::'  _.-!oo @.!-._'-.
\\'.  ||:::::.-!()oo @!()@.-'_.|
'.'-;|:.-'.&$@.& ()$%-'o.'\\U||
`>'-.!@%()@'@_%-'_.-o _.|'||
||-._'-.@.-'_.-' _.-o  |'||
||=[ '-._.-\\U/.-'    o |'||
|| '-.]=|| |'|      o  |'||
||      || |'|        _| ';
||      || |'|    _.-'_.-'
|'-._   || |'|_.-'_.-'
 '-._'-.|| |' `_.-'
    '-.||_/.-'
"
  end

  def encounter(player)
    puts(@display)
    puts("\n\n" + @description)
    puts("\nFound " + @gold_value.to_s + " gold!")
    player.change_gold(@gold_value)
  end
end
