class Api::V1::GamesController < ApplicationController
  before_action :authenticate_user!
  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      ::PlayerService.new.create_admin(@game.id, current_user.id)
      render :show, status: :created
    else
      render_error
    end
  end

  private
  def game_params
    params.require(:game).permit(:name, :game_type, :status)
  end

  def render_error
    render json: { errors: @game.errors.full_messages },
           status: :unprocessable_entity
  end
end
