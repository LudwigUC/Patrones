class Strategy

  def repartir(players, mazo)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Bloque < Strategy

  def repartir(players,mazo)
    players.each do |player|
      cartas = mazo.shift(5)
      player.cartas += cartas
    end
  end
end

class ByOne < Strategy

  def repartir(players, mazo)
    players.each do |player|
      cartas = mazo.shift
      player.cartas += cartas
    end
  end
end

class RandomOne < Strategy

  def repartir(players, mazo)
    players.sample.cartas += mazo.shift
  end
end

class Game

  attr_accessor :strategy

  def initialize(numberOfPlayers, strategy)
    @strategy = strategy
    @mazo = CardDeck.new
    @players = []
    numberOfPlayers.times do |id| @players.push(Player.new(id)) end
  end

  def printState()
    @players.each do |player|
      player.printCards
    end
  end

  def repartir
    @strategy.repartir(@players, @mazo)
  end
end

class CardDeck

  def initialize
    @cards = []
    ["H","T","D","S"].each do
      |kind|
      (1..13).each do |number|
        @cards.push(Card.new(number,kind))
      end
    end
  end

  def shift(n=1)
    @cards.shift(n)
  end

  def shuffle
    @cards.shuffle
  end

  def pickRandom
    randomCard = @cards.sample
    @cards.delete(randomCard)
    return randomCard
  end

  def pickLast
    return @cards.pop
  end
end

class Player

  attr_accessor :cartas

  def initialize(id)
    @id = id
    @cartas = []
  end

  def printCards()
    puts "Player #{@id}: #{@cartas.join(",")}"
  end
end

class Card
  attr_reader :value
  def initialize(value, kind)
    @value = value
    @kind = kind
  end

  def to_s
    return "#{@value} #{@kind}"
  end
end

def client_code
  game = Game.new(3, Bloque.new)
  game.repartir
  game.printState
  game.strategy = ByOne.new
  game.repartir
  game.printState
  game.strategy = RandomOne.new
  game.repartir
  game.printState
end

client_code
