class Travel
  def initialize(balance = 0)
    @balance = balance
  end
  def deposit(amount)
    @balance += amount.to_i
    puts @balance
    take_trip
  end

  def calculate_trip(trip_object)
    puts trip_object.inspect
    rocket_orbits = {'Abuja' => 'earth', 'Spock' => 'Mars', 'ISS' => 'earth', 'Moon' => 'earth'}
    start = trip_object['start']
    stop = trip_object['stop']
    rocket = trip_object['rocket']
    orbit_cost = rocket_orbits[start] == rocket_orbits[stop] ? 50 : 250
    
    case rocket
    when 'Falcon 9'
      orbit_cost *= 2
    end

    puts "trip_rocket: #{rocket}"
    puts "orbit cost: #{orbit_cost}"
    royalty_landing_cost = trip_object[stop] == 'ISS' ? 200 : 0

    trip_cost = orbit_cost + royalty_landing_cost
    if @balance >= trip_cost
      @balance -= trip_cost
    else
      puts 'You do noy have sufficient funds for this trip, please fund you wallet'
      # fund wallet or terminate trip
      puts 'Select action'
      puts '1. Fund Wallet'
      puts '2. exit'
      action = gets.chomp
      if action == '1'
        print 'Enter amount: '
        amount = gets.chomp
        travel.deposit(amount)
      else
        exit(0)
      end
    end
    puts "Trip cost: #{trip_cost}"
    puts "Wallet balance: #{@balance}"

    print "Would you like to take another trip?"
    response = gets.chomp
    if response == 'y'
      take_trip
    else
      exit(0)
    end
  end

  def select_rocket
    rockets = {'1' => 'Falcon 1', '9' => 'Falcon 9'}
    puts
    puts "Select rocket"
    puts "9"
    puts "1"
    rocket = gets.chomp
    while !%w(1 9).include? rocket
      puts "wrong selection"
      rocket = gets.chomp
    end
    puts "You have opted to travel by #{rockets[rocket]}"
    return "Falcon #{rocket}"
  end

  def select_stations(stations)
    choice = gets.chomp
    
    while !%w(1 2 3 4).include? choice
      puts "wrong selection"
      choice = gets.chomp
    end
    
    return choice
  end

  def take_trip
    rocket = select_rocket
    puts

    stations = {'1' => 'Abuja', '2' => 'Moon', '3' => 'Spock', '4' => 'ISS'}
    puts "Take-off station"
    stations.each{|key, value| puts "#{key}. #{value}"}
    start = gets.chomp
    while !%w(1 2 3 4).include? start
      puts "wrong selection"
      select_stations(stations)
    end
    puts
    puts "Select destination"
    stations.each{|key, value| puts "#{key}. #{value}"}
    
    stop = select_stations(stations)

    trip_object = {'start' => stations[start], 'stop' => stations[stop], 'rocket' => rocket}
    calculate_trip(trip_object)
  end
end