class PokemonCommentsController < AuthenticatedController
  def create
    @comment = current_user.comments.create(commentable: pokemon, content: params[:content])

    respond_to do |format|
      format.js
    end
  end

  private

  def pokemon
    @pokemon ||= Pokemon.find(params[:pokemon_id])
  end
end
