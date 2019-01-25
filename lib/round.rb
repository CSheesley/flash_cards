class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = 0
  end

  def take_turn
    @turns += 1
  end

  def current_card

  end

end
