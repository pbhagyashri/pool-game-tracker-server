class Api::GamesController < ApplicationController
    before_action :set_game, only: [:show, :update, :destroy]

    def index
        render json: Game.all
    end

    def create
        
        game = Game.new(game_params)

        if game
           render json: game, status: 200
        else
            render json: game.erros, status: 400
        end

    end

    def show 
    end

    def update
    end

    def destroy
    end

    private

    def set_game
        @game = Game.find_by(id: params[:id])
    end

    def game_params
        params.require(:game).permit(:player1, :player2, :date, :winner)
    end


end