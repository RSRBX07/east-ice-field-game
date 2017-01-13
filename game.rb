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

def pilar_melt _bridge = bridge
  puts "Ice is melting"
  _bridge.pop
end

def roll dice
  dice.sample
end

def bridge_fall
  puts "Bridge falls !"
end

def go_to_bridge board
  # chose an animal and remove it from ice field
  return unless animal = board[:ice_field][:animals].pop
  # add animal to bridge
  board[:bridge][:animals].push animal
end

def go_to_igloo board
  # chose an animal and remove it from bridge
  return unless animal = board[:bridge][:animals].pop
  # add animal to bridge
  board[:igloo][:animals].push animal
end

def player_roll_dice dice
  puts "Next player roll dice.\n..."
  puts rolled = roll dice
  pilar_melt if rolled == :pilar_melt
end

player_roll_dice dice