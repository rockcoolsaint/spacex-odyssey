require_relative 'travel_class'

travel = Travel.new

puts "Please select an action"
puts "1. deposit"
puts "2. take trip"
action = gets.chomp

if action == "1"
  print 'Enter amount: '
  amount = gets.chomp
  travel.deposit(amount)
else
  travel.take_trip
end