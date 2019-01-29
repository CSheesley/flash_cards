require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'


card_1 = Card.new("In which sports city will you find Soldier Field?", "Chicago", :Sports)
card_2 = Card.new("Which state became the 50th state of the USA in 1959?", "Hawaii", :History)
card_3 = Card.new("In geometry, what shape does the Pythagorean Theorum refer to?", "Triangle", :STEM)
card_4 = Card.new("Who holds the all time record for stolen bases in Major League Baseball?", "Rickey Henderson", :Sports)
card_5 = Card.new("In what state can you find Grand Teton National Park?", "Wyoming", :Geography)
card_6 = Card.new("Which planet has the most moons?", "Jupiter", :STEM)
card_7 = Card.new("What is the capital of Spain?", "Madrid", :Geography)
card_8 = Card.new("In what year did the Civil War begin?", "1861", :History)

cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8]
deck = Deck.new(cards.shuffle)
round = Round.new(deck)

round.start

until round.turns.count == deck.cards.count
  puts "This is card number #{round.turns.count + 1} of #{deck.cards.count}"
  puts round.current_card.question
  print "Answer: "
  user_answer = gets.chomp
  turn = round.take_turn(user_answer) #don't fully understand how this line is working
  puts turn.feedback
  puts ""
end

puts "****** Game Over! ******"
puts "You had #{round.number_correct} out of #{round.turns.count} for a total score of #{round.percent_correct}%."
puts ""
puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
puts "History - #{round.percent_correct_by_category(:History)}% correct"
puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
puts "Sports - #{round.percent_correct_by_category(:Sports)}% correct"
puts ""
puts "   *** Thank You for Playing! ***   "
