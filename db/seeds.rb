Pokeapi::Pokemon.all.each do |base_pokemon|
  pokemon = Pokeapi::Pokemon.find(base_pokemon.id)
  type = Type.find_or_create_by(name: pokemon.data['types'].first['type']['name'])
  Pokemon.create(name: pokemon.name,
                 weight: pokemon.weight,
                 height: pokemon.height,
                 image: pokemon.image,
                 base_experience: pokemon.base_experience,
                 type: type)
end

(1..20).each do |move_id|
  move = HTTParty.get("http://pokeapi.co/api/v2/move/#{move_id}")
  type = Type.find_or_create_by(name: move['type']['name'])
  Move.create(name: move['names'].first['name'],
              accuracy: move['accuracy'],
              effect_chance: move['effect_chance'],
              pp: move['pp'],
              priority: move['priority'],
              power: move['power'],
              type: type)
end
