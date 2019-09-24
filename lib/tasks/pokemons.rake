require 'colorize'

namespace :pokemons do
  desc 'List of names of all Pokemons and their hrefs'
  task all: :environment do
    Pokeapi::Pokemon.all.each do |pokemon|
      puts pokemon.name_and_url
    end
  end

  task best: :all do
    puts "\nBEST POKEMON"
    puts Pokeapi::Pokemon.all.sample.name_and_url.colorize(:red)
  end
end
