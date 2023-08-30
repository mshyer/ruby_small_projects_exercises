items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) do |foods|
  system 'clear'
  puts "Gathering..."
  sleep 1
  foods.each do |food|
    puts food
    sleep 1
  end
end