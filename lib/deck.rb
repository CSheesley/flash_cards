class Deck
  attr_reader :cards

  def initialize(cards = []) #don't think an empty array option is necessary?
    @cards = cards
  end

  def cards_in_category(category_argument)
    category_cards = []
    @cards.map do |flash_card| # don't think map is being utilized to full potential here?
      if flash_card.category == category_argument
        category_cards << flash_card
      end
    end
    category_cards
  end
end
