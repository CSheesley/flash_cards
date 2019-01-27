require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("Who holds the all time record for stolen bases in Major League Baseball?", "Rickey Henderson", :Sports)

cards = [card_1, card_2, card_3, card_4]

deck = Deck.new(cards)
round = Round.new(deck)

round.start

until round.turns.count == deck.cards.count
  puts "This is card number #{round.turns.count + 1} of #{deck.cards.count}"
  puts round.current_card.question
  print "Answer: "
  user_answer = gets.chomp
  round.take_turn(user_answer)
  puts ""
end

puts "****** Game Over! ******"
puts "You had #{round.number_correct} out of #{round.turns.count} for a total score of #{round.percent_correct}%."
puts ""
puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
puts "Sports - #{round.percent_correct_by_category(:Sports)}% correct"
puts ""
puts "****** Thank You for Playing! ******"










# Start the round using a new method called start (round.start)
# p current card card question
# collect answer and store in take_turn argument
# evaluate and store
# give feedback
# next card
#
# loop until current_card = @deck.card.count max
# or to a times loop based on card total?
