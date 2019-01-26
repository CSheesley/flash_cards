require 'pry'

class Round
  attr_reader :deck, :turns, :current_card, :number_correct, :number_incorrect

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @number_correct = 0
    @number_incorrect = 0
    @correct_cards = []
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, @current_card)
    @turns << current_turn

    if current_turn.correct?
      @number_correct += 1
      @correct_cards << current_turn
    else
      @number_incorrect += 1
      @correct_cards << current_turn
    end

    @current_card = @deck.cards[@turns.length]
    return current_turn
  end





end
