class PokemonsController < ApplicationController
  def new
    @pokemon = Pokemon.new
  end
  
  def create
    # @dog = Dog.create(pokemon_params)
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.health = 100
    @pokemon.level = 1
    @pokemon.trainer = current_trainer

    if @pokemon.save
      redirect_to controller: "trainers", action: "show", id: current_trainer.id
    else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      # if (@pokemon.name.blank?)
        # flash[:error] = "The name you entered was blank. Please try again."
      # else
        # flash[:error] = "There's already a Pokemon named " + @pokemon.name + ". Please try again."
      # end
      render "new"
    end
  end

  def capture
    @pokemon = Pokemon.find(params[:id])
    @pokemon.trainer_id = current_trainer.id
    @pokemon.save
    
    redirect_to root_path
  end
  

  private
  def pokemon_params
    params.require(:pokemon).permit(:name)
  end

end
