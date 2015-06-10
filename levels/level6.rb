class Player
  attr_reader :health, :warrior
  FULL_HEALTH = 20
  LOW_HEALTH = 10

  def initialize
    @health = FULL_HEALTH
    @direction = :backward
  end

  def play_turn(warrior)
    @warrior = warrior
    space = warrior.feel(@direction)

    if space.captive?
      warrior.rescue!(@direction)
    elsif space.enemy?
      warrior.attack!(@direction)
    elsif attacked? && low_health?
      warrior.walk!(:backward)
    elsif !attacked? && lost_health?
      warrior.rest!
    elsif !space.wall?
      warrior.walk!(@direction)
    elsif space.wall?
      flip_direction
    end

    @health = warrior.health
  end

  def attacked?
    warrior.health < @health
  end

  def low_health?
    warrior.health < LOW_HEALTH
  end

  def lost_health?
    warrior.health < FULL_HEALTH
  end

  def flip_direction
    if @direction == :forward
      @direction = :backward
    else
      @direction = :forward
    end
  end
end
