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
      redirect_to root_path, notice: t(:not_found, scope: [:activerecord, :exceptions])
    end
    puts "leaving games#show"
  end
  
  def crop
    fruit = Fruit.find params[:fruit_id]
    if  @game.allow_crop?(fruit)
      fruit.crop
      if fruit.save
        set_last_player_action
        redirect_to game_path(@game) if !@game.orchard.empty?
        redirect_to game_win_path @game if @game.orchard.empty?
      else
        redirect_to game_path(@game), notice: "#{fruit.errors.messages}"
      end
    else
       redirect_to game_path(@game), notice: "cueillette interdite"
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
          redirect_to game_path if !crow.in_orchard?
          redirect_to game_loose_path @game if crow.in_orchard?
        else
          redirect_to game_path, notice: "#{crow.errors.messages}"
        end
      end
    end
  end


   def roll
    if @game.allow_roll?
      @game.dice.roll
      if @game.dice.save
        # on ne peut roller une 2eme fois que si ya eu action step ou crop
        set_last_player_action
        redirect_to game_path
      end
    else
       redirect_to game_path(@game), notice: "Lancé du dé interdit"
    end
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
