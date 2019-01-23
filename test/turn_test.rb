require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

# create a Card.new in this file to test?
# link to the card_test.rb file where a Card.new is already created?
# insert Card.new inside of each test method below?

class TurnTest < Minitest::Test

  def test_that_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Nome", card)

    assert_instance_of Turn, turn
  end

  def test_that_it_makes_a_guess #guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  def test_that_the_guess_is_correct #correct?
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert turn.correct?
  end

  def test_that_the_guess_is_incorrect
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Nome", card)

    refute turn.correct?
  end

  def test_that_it_receives_correct_feedback #feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Correct!", turn.feedback
  end

  def test_that_it_receives_incorrect_feedback #feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Nome", card)

    assert_equal "Incorrect.", turn.feedback
  end
end
