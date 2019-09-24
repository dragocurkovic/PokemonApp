<!-- include(/home/drago/ruby/pokebattles/spec/support/
      api_doc/v1/markdown_descriptions/api.md) -->

# Group Move



## Move [/moves]

Move
### Get moves [GET /moves]

Returns list of moves


+ Request /api/v1/moves ()
+ Response 200 (application/json)

        {
          "data": [
        
          ]
        }
### Get move [GET /moves/{id}]



+ Parameters
    + id: `1` (number, required) - move id

+ Request /api/v1/moves/2692 ()
+ Response 200 (application/json)

        {
          "data": {
            "id": "2692",
            "type": "moves",
            "attributes": {
              "name": "move1",
              "accuracy": null,
              "effect-chance": null,
              "pp": null,
              "priority": null,
              "power": null
            },
            "relationships": {
              "type": {
                "data": {
                  "id": "4253",
                  "type": "types"
                }
              }
            }
          }
        }

# Group Pokemon



## Pokemon [/pokemons]

Pokemon
### Get pokemons [GET /pokemons]

Returns list of pokemons


+ Request /api/v1/pokemons ()
+ Response 200 (application/json)

        {
          "data": [
        
          ]
        }
### Get pokemon [GET /pokemons/{id}]



+ Parameters
    + id: `1` (number, required) - pokemon id

+ Request /api/v1/pokemons/1606 ()
+ Response 200 (application/json)

        {
          "data": {
            "id": "1606",
            "type": "pokemons",
            "attributes": {
              "name": "pokemon1",
              "base-experience": null,
              "height": null,
              "weight": null,
              "image": null
            },
            "relationships": {
              "type": {
                "data": {
                  "id": "4254",
                  "type": "types"
                }
              },
              "moves": {
                "data": [
        
                ]
              }
            }
          }
        }

# Group Pokemon Ownership



## UserPokemons [/users/id/pokemons]

UserPokemons
### Get pokemons [GET /users/id/pokemons]

Returns list of user pokemons


+ Request /api/v1/users/1989/pokemons ()
+ Response 200 (application/json)

        {
          "data": [
        
          ]
        }

# Group Type



## Type [/types]

Type
### Get types [GET /types]

Returns list of types


+ Request /api/v1/types ()
+ Response 200 (application/json)

        {
          "data": [
        
          ]
        }
### Get type [GET /types/{id}]



+ Parameters
    + id: `1` (number, required) - type id

+ Request /api/v1/types/4255 ()
+ Response 200 (application/json)

        {
          "data": {
            "id": "4255",
            "type": "types",
            "attributes": {
              "name": "type3"
            },
            "relationships": {
              "pokemons": {
                "data": [
        
                ]
              },
              "moves": {
                "data": [
        
                ]
              }
            }
          }
        }
