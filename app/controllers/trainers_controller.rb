class TrainersController < ApplicationController
  before_filter :authenticate_trainer!

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def damage
    @pokemon = Pokemon.find(params[:id])
    @pokemon.health -= 10
    if (@pokemon.health <= 0)
      @pokemon.destroy
    else
      @pokemon.save
    end
    
    redirect_to action: "show", id: current_trainer.id
    # redirect_to controller: "trainers", action: "show", id: current_trainer.id
    # redirect_to url_for(:controller => "trainers", :action => "show", :id => 1)
    # redirect_to :trainers#show
  end


end
