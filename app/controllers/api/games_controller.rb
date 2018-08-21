class Api::GamesController < ApplicationController
    before_action :set_game, only: [:show, :update, :destroy]

    def index
        render json: Game.all
    end

    def create
        
        game = Game.new(game_params)
        player1 = User.find_by(username: params[:game][:player1])
        player2 = User.find_by(username: params[:game][:player2])

        if game.save
            
            if player1 && player2
                game.users << player1
                game.users << player2
            end

            if game.winner 
                if game.winner && player1.username
                
                    player1.victories = player1.victories += 1
                    player1.save
                
                elsif game.winner && player2.username
                    player2.victories = player2.victories += 1
                    player2.save
                
                end
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