require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  end

  def test_that_it_exists
    cards = [@card_1, @card_2, @card_3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_that_shows_cards_present_in_deck
    cards = [@card_1, @card_2, @card_3]
    deck = Deck.new(cards)

    assert_equal [@card_1, @card_2, @card_3], deck.cards
  end

  def test_that_numbers_of_cards_in_deck_are_counted
    cards = [@card_1, @card_2, @card_3]
    deck = Deck.new(cards)

    assert_equal 3, deck.cards.count
  end

  def test_that_cards_can_be_seperated_by_category
    cards = [@card_1, @card_2, @card_3]
    deck = Deck.new(cards)

    assert_equal [@card_1], deck.cards_in_category(:Geography)
  end

  def test_that_cards_can_be_seperated_by_a_different_category
    cards = [@card_1, @card_2, @card_3]
    deck = Deck.new(cards)

    assert_equal [@card_2, @card_3], deck.cards_in_category(:STEM)
  end

  def test_that_returns_an_empty_array_if_category_is_not_present
    cards = [@card_1, @card_2, @card_3]
    deck = Deck.new(cards)

    assert_equal [], deck.cards_in_category(:History)
  end
end
