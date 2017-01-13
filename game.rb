# pierre
bridge = ["pilar", "pilar", "pilar", "pilar", "pilar", "pilar"]
dice = ["pilar melt", "go to bridge", "go to igloo"]
animals = ["fox", "bear", "rabbit", "pinguin"]
board_cells = [
  {
    name: "ice field",
    animals: []
  },
  {
    name: "bridge",
    animals: []
  },
  {
    name: "igloo",
    animals: []
  }
]

def ice_melt bridge
  puts "Ice is melting"
  bridge.pop
end

def roll dice
  dice.sample
end

def bridge_fall
  puts "Bridge falls !"
end
# bob

#j
