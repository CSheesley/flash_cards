require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'


class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  def test_that_it_exists
    turn = Turn.new("Nome", @card)

    assert_instance_of Turn, turn
  end

  def test_that_it_has_a_guess
    turn = Turn.new("Juneau", @card)

    assert_equal "Juneau", turn.guess
  end

  def test_that_it_has_a_card
    turn = Turn.new("Juneau", @card)

    assert_equal @card, turn.card
  end

  def test_that_the_guess_is_correct
    turn = Turn.new("Juneau", @card)

    assert turn.correct?
  end

  def test_that_the_guess_is_incorrect
    turn = Turn.new("Nome", @card)

    refute turn.correct?
  end

  def test_that_it_receives_correct_feedback
    turn = Turn.new("Juneau", @card)

    assert_equal "Correct!", turn.feedback
  end

  def test_that_it_receives_incorrect_feedback
    turn = Turn.new("Nome", @card)

    assert_equal "Incorrect.", turn.feedback
  end
end
