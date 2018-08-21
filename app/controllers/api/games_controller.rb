class Api::GamesController < ApplicationController

    def index
        render json: Game.all
    end

    def create
    end

    def show 
    end

    def update
    end

    def destroy
    end

    private

    def game_params
        params.require(:game).permit(:player1, :player2, :date, :winner)
    end


end