class Api::GamesController < ApplicationController
    before_action :set_game, only: [:show, :update, :destroy]

    def index
        render json: Game.all
    end

    def create
        
        game = Game.new(game_params)
        player1 = User.find_by(username: params[:player1])
        player2 = User.find_by(username: params[:player2])
        

        if game
            
            if player1 && player2
                game.users << player1
                game.users << player2
            end

            render json: game, status: 200
        else
            render json: game.erros, status: 400
        end

    end

    def show

        if @game
            render json: @game, status: 200
        else
            render json: @game.erros, status: 400
        end
    
    end

    def update

        if @game.update(game_params)
            render json: @game, status: 200
        else
            render json: @game.erros, status: 400
        end

    end

    def destroy

        if @game.destroy(game_params)
            render json: @game, status: 200
        else
            render json: @game.erros, status: 400
        end

    end

    private

    def set_game
        @game = Game.find_by(id: params[:id])
    end

    def game_params
        params.require(:game).permit(:player1, :player2, :date, :winner)
    end


end