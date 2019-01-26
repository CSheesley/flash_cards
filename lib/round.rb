class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, @current_card)
    @turns << current_turn
    @current_card = @deck.cards[@turns.lengths]
  end

  def feedback
    if take_turn(guess) == current

  end

  end


end
