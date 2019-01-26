require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [card_1, card_2, card_3]
    @deck = Deck.new(@cards)
  end

  def test_that_it_exists
    round = Round.new(@deck)

    assert_instance_of Round, round
  end

  def test_that_it_starts_with_deck
    round = Round.new(@deck)

    assert_equal @deck, round.deck #why will @cards not work for check? |Because not the same object
  end

  def test_that_turns_starts_as_an_empty_array
    round = Round.new(@deck)

    assert_equal [], round.turns
  end

  def test_that_turn_is_on_current_card
    round = Round.new(@deck)

    assert_equal @deck.cards[0], round.current_card
  end

  def test_that_turns_array_increased_when_take_turn_called
    round = Round.new(@deck)
    round.take_turn("Juneau")

    assert_equal 1, round.turns.length
  end

  def test_that_a_turn_object_is_created
    round = Round.new(@deck)

    assert_instance_of Turn, round.take_turn("Juneau")
  end

  def test_to_see_if_answer_was_correct
    round = Round.new(@deck)

    assert_equal "Juneau", round.take_turn("Juneau").guess
  end

  def test_that_next_card_in_deck_comes_up_after_take_turn
    skip
    round = Round.new(@deck)
    round.take_turn("Juneau") #Error msg - NameError: uninitialized constant Round::Turn

    assert_equal @cards[1], @current_card
  end

  def test_that_the_guess_was_correct #is this test correct or just hard coded to pass?
    round = Round.new(@deck)
    turn = Turn.new("Juneau", @deck.cards[0])

    assert turn.correct?
  end

  def test_that_the_guess_was_incorrect
    round = Round.new(@deck)
    turn = Turn.new("Nome", @deck.cards[0])

    refute turn.correct?
  end

  def test_that_a_turn_was_taken
    skip
    round.take_turn
    #test for command
    #test for query
    assert_equal
  end

  # test that incorrect cards in incorrect array
  # test that correct cards are in correct array


end


# A Round is initialized with a Deck.
# The idea is that when we start a Round, the current card is the first in the deck (the first in the Deck’s array of Cards).
# When we make a guess, the guess is recorded, and the next card in the deck becomes the current card.

## The take_turn method is the crux of this problem.
# The take_turn method takes a string representing the guess.
# It should create a new Turn object with the appropriate guess and Card.
# It should store this new Turn, as well as return it from the take_turn method.
# Also, when the take_turn method is called, the Round should move on to the next card in the deck.
