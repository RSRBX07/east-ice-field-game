# pierre
bridge = [:pilar, :pilar, :pilar, :pilar, :pilar, :pilar]
dice = [:pilar_melt, :go_to_bridge, :go_to_igloo]
animals = [:fox, :bear, :rabbit, :pinguin]
board = {
  ice_field: {
    animals: []
  },
  bridge: {
    animals: []
  },
  igloo: {
    animals: []
  }
}

# All animals are on first cell on start 
board[:ice_field][:animals] = animals

def pilar_melt bridge
  puts "Ice is melting"
  bridge.pop
end

def roll dice
  puts rolled = dice.sample
  rolled
end

def bridge_fall
  puts "Bridge falls !"
end

def go_to_bridge board
  # chose an animal and remove it from ice field
  return unless animal = board[:ice_field][:animals].pop
  # add animal to bridge
  board[:bridge][:animals].push animal
  puts "#{animal} is now on bridge"
end

def go_to_igloo board
  # chose an animal and remove it from bridge
  return unless animal = board[:bridge][:animals].pop
  # add animal to bridge
  board[:igloo][:animals].push animal
  puts "#{animal} is now safe in igloo"
end

def players_win board
  if board[:ice_field][:animals].empty? && board[:bridge][:animals].empty?
    puts "All animals are safe ! You all win."
    exit
  end
end

30.times do
  puts "Next player roll dice.\n..."
  rolled = roll dice
  pilar_melt bridge if rolled == :pilar_melt
  go_to_bridge board if rolled == :go_to_bridge
  go_to_igloo board if rolled == :go_to_igloo
  players_win board
end