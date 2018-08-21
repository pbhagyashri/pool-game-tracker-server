require 'auth'
class Api::UsersController < ApplicationController
    
    def show
    end

    def signup
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :victories)
    end
end