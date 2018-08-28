require 'auth'
class Api::UsersController < ApplicationController

    def index 

        users = User.all
        render json: users
    
    end

    def sorted_users
    
        users = User.all
        sorted_users = users.sort_by{|user| user.victories}.reverse
        
        if sorted_users
            render json: sorted_users
        else
            render json: {message: "No leaders found"}, status: 400
        end
        
    end
    
    def show
    end

    def signup
        
        user = User.new(user_params)

        if user.save
            token = Auth.create_token(user)
            returned_user = Auth.decode_token(token)

            render json: {username: user.username, token: token}, status: 200
        else
            render json: {message: user.errors}, status: 400
          
        end
    
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :victories)
    end
end