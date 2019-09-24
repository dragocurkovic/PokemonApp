Rails.application.routes.draw do
  devise_for :users

  resources :pokemons, only: [:show, :index]
  resources :types, only: [:index]
  resources :moves, only: [:index]
  resources :pokemon_ownerships, only: [:index, :create, :edit, :update, :destroy]
  resources :pokemon_battles, only: [:index, :show, :update, :create], controller: 'arena'
  resources :pokemon_battle_rounds, only: [:create]

  resources :pokemons do
    collection do
      resources :types, only: [:show], param: :name, controller: 'pokemon_types', as: :pokemon_types
    end

    resource :vote, only: [:create, :destroy], controller: 'pokemon_votes'

    resources :comments, only: [:create], controller: 'pokemon_comments'
  end

  root to: 'pokemons#index'

  namespace 'api' do
    namespace 'v1' do
      resources :pokemons, only: [:index, :show]
      resources :types, only: [:index, :show]
      resources :moves, only: [:index, :show]
      resources :sessions, only: [:create]
      resources :users, only: [] do
        resources :pokemons, only: [:index], controller: 'user_pokemons'
      end
    end
  end
end
