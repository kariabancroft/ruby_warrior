class Player
  def play_turn(warrior)
    if warrior.health < 20 && warrior.feel.empty?
      warrior.rest!
    elsif !warrior.feel.empty?
      warrior.attack!
    else
      warrior.walk!
    end
  end
end
