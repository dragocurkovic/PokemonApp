module Pokeapi
  class Pokemon
    include HTTParty

    base_uri 'http://pokeapi.co/api/v2'

    attr_reader :id, :name, :height, :weight, :base_experience, :image, :url, :data

    def initialize(data = {})
      @id = data['id'] || parse_id_from_url(data['url'])
      @name = data['name']
      @height = data['height']
      @weight = data['weight']
      @base_experience = data['base_experience']
      @image = image_from_sprites(data['sprites'])
      @url = data['url']
      @data = data
    end

    def self.all
      get('/pokemon')['results'].map { |hash| new(hash) }
    end

    def self.find(id)
      new(get("/pokemon/#{id}"))
    end

    def name_and_url
      "Name: #{name.ljust(10)} \tLink: #{url}"
    end

    private

    def parse_id_from_url(url)
      url.split('/').last
    end

    def image_from_sprites(sprite_hash)
      return if sprite_hash.nil?

      sprite_hash.each do |_, value|
        return value if value.present?
      end
    end
  end
end
