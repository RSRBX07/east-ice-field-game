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

def go_to_bridge animal, board
  # remove animal from ice field
  board[:ice_field][:animals].delete animal
  # add animal to bridge
  board[:bridge][:animals].push animal
end

def go_to_igloo animal, board
  # remove animal from ice field
  board[:bridge][:animals].delete animal
  # add animal to bridge
  board[:igloo][:animals].push animal
end

def player_roll_dice dice
  puts "Next player roll dice.\n..."
  puts rolled = roll dice
  pilar_melt if rolled == :pilar_melt
end

player_roll_dice dice