# pierre
bridge = ["pilar", "pilar", "pilar", "pilar", "pilar", "pilar"]
dice = ["pilar melt", "go to bridge", "go to igloo"]
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

def ice_melt _bridge = bridge
  puts "Ice is melting"
  _bridge.pop
end

def roll dice
  puts dice.sample
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
