class Player
  attr_reader :health

  def initialize
    @health = 20
  end

  def play_turn(warrior)
    if warrior.health < 20 && !attack?(warrior)
      warrior.rest!
    elsif warrior.feel.captive?
      warrior.rescue!
    elsif !warrior.feel.empty?
      warrior.attack!
    else
      warrior.walk!
    end

    @health = warrior.health
  end

  def attack?(warrior)
    warrior.health < @health
  end
end
