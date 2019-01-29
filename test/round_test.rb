require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [@card_1, @card_2, @card_3]
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

  def test_to_see_if_answer_was_incorrect
    round = Round.new(@deck)

    refute_equal "Juneau", round.take_turn("Nome").guess
  end

  def test_that_next_card_in_deck_comes_up_after_take_turn
    round = Round.new(@deck)
    round.take_turn("Juneau") #Error msg - NameError: uninitialized constant Round::Turn

    assert_equal @card_2, round.current_card
  end

  def test_that_the_guess_was_correct #does not really belong - nothing asserted about the Round
    round = Round.new(@deck)
    turn = Turn.new("Juneau", @deck.cards[0])

    assert turn.correct?
  end

  def test_that_the_guess_was_incorrect #does not really belong - nothing asserted about the Round
    round = Round.new(@deck)
    turn = Turn.new("Nome", @deck.cards[0])

    refute turn.correct?
  end

  def test_that_shows_correct_answers_by_category
    round = Round.new(@deck)
    turn = Turn.new("Juneau", @deck.cards[0])
    round.take_turn("Juneau")

    assert_equal 1, round.number_correct_by_category(:Geography)
  end

  def test_correct_percentage_by_category
    round = Round.new(@deck)
    turn = Turn.new("Juneau", @deck.cards[0])
    round.take_turn("Juneau")
    round.take_turn("Jupiter")

    assert_equal 50.0, round.percent_correct
  end

  def test_shows_correct_percentage_by_category
    round = Round.new(@deck)
    turn = Turn.new("Juneau", @deck.cards[0])
    round.take_turn("Juneau")
    round.take_turn("Jupiter")
    round.take_turn("North north west")

  assert_equal 50.0, round.percent_correct_by_category(:STEM)
  assert_equal 100.0, round.percent_correct_by_category(:Geography)
  end
end
