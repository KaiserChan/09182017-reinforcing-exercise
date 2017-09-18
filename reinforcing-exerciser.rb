ballots = [
  {1 => 'Smudge', 2 => 'Tigger', 3 => 'Simba'},
  {1 => 'Bella', 2 => 'Lucky', 3 => 'Tigger'},
  {1 => 'Bella', 2 => 'Boots', 3 => 'Smudge'},
  {1 =>'Boots', 2 => 'Felix', 3 => 'Bella'},
  {1 => 'Lucky', 2 => 'Felix', 3 => 'Bella'},
  {1 => 'Smudge', 2 => 'Simba', 3 => 'Felix'}
]


participants = []
participants << ballots.map { |hash| hash[1] }.uniq
participants << ballots.map { |hash| hash[2] }.uniq
participants << ballots.map { |hash| hash[3] }.uniq

unique_contestants = participants.flatten.uniq

puts unique_contestants.inspect


points_array = []
unique_contestants.each do |contestant|
  points = 0
  ballots.each do |hash|
    if hash[1] == contestant
      points += 3
    elsif hash[2] == contestant
      points +=2
    elsif hash[3] == contestant
      points += 1
    end
  end
  points_array << points
end

tally = unique_contestants.zip(points_array)
final_result = Hash[tally]
puts final_result


final_result.select do |k, v|
  if v == final_result.values.max
    puts "#{k} is the final winner with a score of #{v} points"
  end
end
