require 'pry'

class Round
  attr_reader :deck, :turns, :current_card, :number_correct, :correct_cards

  def initialize(deck)
    @deck = deck
    @current_card = @deck.cards[0]
    @turns = []
    @number_correct = 0
    @correct_cards = []
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, @current_card)
    @turns << current_turn

    p current_turn.feedback

    if current_turn.correct?
      @number_correct += 1
      @correct_cards << current_turn
    end

    @current_card = @deck.cards[@turns.length]
    return current_turn
  end

  def number_correct_by_category(category_arg)
    correct_by_category = @correct_cards.find_all do |turn|
      turn.card.category == category_arg
    end
    correct_by_category.count
  end

  def percent_correct
    percentage_decimal = @number_correct / @turns.count.to_f
    percentage_decimal * 100
  end

  def percent_correct_by_category(category_arg) #is naming confusing in this method?
    all_by_category = @turns.find_all do |turn|
      turn.card.category == category_arg
    end
    (number_correct_by_category(category_arg) / all_by_category.count.to_f) * 100
  end

  def start #need to write a test?
    puts "-" * 45
    puts "Welcome! You are playing with #{deck.cards.count} cards."
    puts "-" * 45
  end
end
