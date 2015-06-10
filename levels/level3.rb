class Player
  def play_turn(warrior)
    if warrior.health < 15 && warrior.feel.empty?
      warrior.rest!
    elsif !warrior.feel.empty?
      warrior.attack!
    else
      warrior.walk!
    end
  end
end
