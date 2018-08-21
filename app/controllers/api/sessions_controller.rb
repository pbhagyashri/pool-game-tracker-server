require 'auth'
class Api::SessionsController < ApplicationController

    def login

        #take user's email and password from client and find user with the email, and if user is #found. authenticate with #password.  if user is authenticated, create a token for user and #decode it and send back user's details
        
        user = User.find_by(email: params[:user][:email])

        if user && user.authenticate(params[:user][:password])
        
            token = Auth.create_token(user)

            returned_user = Auth.decode_token(token)
            
            render json: {username: user.username, id: user.id, email: user.email, token: token}, status: 200
        else
            render json: {errors: "Email or Password is incorrect"}, status: 500
        end
    
    end

    def logout
    end

end