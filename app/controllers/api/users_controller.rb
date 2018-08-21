require 'auth'
class Api::UsersController < ApplicationController
    
    def show
    end

    def signup
        
        user = User.new(user_params)

        if user.save
            token = Auth.create_token(user)
            returned_user = Auth.decode_token(token)

            render json: {username: user.username, id: user.id, email: user.email, token: token}, status: 200
        else
            render json: {message: user.errors}, status: 400
          
        end
    
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :victories)
    end
end