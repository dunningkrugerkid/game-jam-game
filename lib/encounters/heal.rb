class Heal < Encounter
  def initialize()
    @description = "A place to sit marks a moment of brief relaxation and recovery during your journey."
    @short_display = "H"
    @display = "

         _                     _
        (_).-----------------.(_)
        /.'                   '.\\
        |:                     :|
        |:                     :|
        |:                     :|
        |:                     :|
        .'---------------------'.
      .'                         '.
    .'-----------------------------'.
      '.............................'
      \\   _____________________   /
       | |_)                 (_| |
       | |                     | |
       | |                     | |
      (___)                   (___)

        "
  end

  def encounter(player)
    puts(@display)
    puts("\n\n" + @description)
    player.heal(25)
    puts("\nHealed for 25!")
  end
end
