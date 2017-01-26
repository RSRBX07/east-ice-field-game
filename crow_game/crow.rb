class Crow
  attr_reader :advancement

  def walk
    @advancement += 1
  end

  def win
    put "Crow win :-( "
  end

  def lose
    puts "Crow lose :-)"
  end

  private

  def initialize
    @advancement = 0
  end
end