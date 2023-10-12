class Api::V1::GamesController < ApplicationController
  before_action :authenticate_user!
  def show
    @game = Game.find(params[:id])
  end
end
