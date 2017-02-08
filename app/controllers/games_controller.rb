class GamesController < ApplicationController
  before_action :set_game, :only =>[:crop, :step, :roll, :win, :loose]

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
      puts "got game"
    rescue ActiveRecord::RecordNotFound => err
      puts "I m starting rescue"
      redirect_to root_path, notice: t(:not_found, scope: [:activerecord, :exceptions])
      puts "I've finished rescue"
    end
    puts "leaving games#show"
  end
  
  def crop
    fruit = Fruit.find params[:fruit_id]
    if  @game.allow_crop?(fruit)
      fruit.crop
      if fruit.save
        set_last_player_action
        redirect_to game_path(fruit.game)
      else
        redirect_to game_path(fruit.game), notice: "#{fruit.errors.messages}"
      end
    else
       redirect_to game_path(fruit.game), notice: "cueillette interdite"
    end
  end

  def step
    crow = @game.crow
    if crow.game.dice.showing_face != "crow"
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
   puts "last_player_action set to #{@game.last_player_action}"
  end

  def set_game
    @game = Game.find params[:id]
  end

end
