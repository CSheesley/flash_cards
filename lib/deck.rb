class Deck
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category_argument)
    category_cards = []
    @cards.each do |flash_card|
      if flash_card.category == category_argument
        category_cards << flash_card
      end
    end
    category_cards # 'got eached' initial error was due to scoping issue
  end

end
