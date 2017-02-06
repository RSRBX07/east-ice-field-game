class GamesController < ApplicationController
  before_action :set_game, :only =>[:step, :roll, :win, :loose]

  def index
    @games = Game.recent
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.new
    game.save
    redirect_to game_path id: game.id
  end

  def show
    begin
      @game = Game.find(params[:id])
    rescue ActiveRecord::RecordNotFound => err
      puts "I m starting rescue"
      redirect_to root_path, notice: t(:not_found, scope: [:activerecord, :exceptions])
      puts "I've finished rescue"
    end
  
  end
  
  def crop
    fruit = Fruit.find fruit_params[:id]    
    if showing_face == fruit.color
      fruit.crop
      if fruit.save
        redirect_to game_path(fruit.game)
      else
        redirect_to game_path(fruit.game), notice: "#{fruit.error.messages}"
      end
    end
  end

  def step
    crow = @game.crow
    if dice.value != "crow"
    else
      if crow.game.last_player_action != "step"
        crow.step
        if crow.save
          # mise à jour de l'action : pour controller l'avancement du crow, il faut connaitre la derniere action du jeu
        set_last_player_action
          redirect_to game_path
        else
          redirect_to game_path, notice: "#{crow.errors.messages}"
        end
      end
    end
  end


   def roll
    @game.dice.roll
    @game.dice.save
    set_last_player_action
    redirect_to game_path
  end

  def win
    #recherche du jeu

    @game.win
    @game.save!
    #sauvegarder le jeu
    
    redirect_to  root_path
  end

  def loose
    @game.status = "loose"
    @game.save
    redirect_to root_path
  end

  private

  def set_last_player_action
   @game.last_player_action = action_name
   @game.save
  end

  def fruit_params
    params.permit :id
  end

  def set_game
    @game = Game.find params[:id]
  end

end
