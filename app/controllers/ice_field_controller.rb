class IceFieldController < ApplicationController
  before_action :set_game, :only =>[:melt, :step, :roll, :win, :loose]

  def melt
    @game.bridge.melt
    if @game.bridge.save
      # on ne peut roller une 2eme fois que si ya eu action step ou crop
      set_last_player_action
      redirect_to ice_field_game_path
    end
  end

  def roll
    @game.dice.roll
    if @game.dice.save
      # on ne peut roller une 2eme fois que si ya eu action step ou crop
      set_last_player_action
      redirect_to ice_field_game_path(@game)
    end
  end

  def step
    set_last_player_action
    redirect_to ice_field_game_path
  end

  def index
    @games = IceFieldGame.all
  end

  def new
    @game = IceFieldGame.new
  end

  def create
    game = IceFieldGame.new
    game.save
    redirect_to ice_field_game_path id: game.id
  end

  def show
    begin
      @game = IceFieldGame.find(params[:id])
    rescue ActiveRecord::RecordNotFound => err
      redirect_to ice_field_game_path, notice: t(:not_found, scope: [:activerecord, :exceptions])
    end
  end

  private

  def set_last_player_action
    @game.last_player_action = action_name
    @game.save
  end

  def set_game
    @game = IceFieldGame.find params[:id]
  end


end
