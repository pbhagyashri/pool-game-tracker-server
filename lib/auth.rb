require 'jwt'

class Auth

    #self.create_token(user_object) method will take user data sent from client and generate an #encoded token to be sent back to client for user authentication and authorization purpose.

    def self.create_token(user_object)
        
        payload  = {user: JSON.parse(user_object.to_json)}

        token = JWT.encode(payload, "build", "HS256")
    end

    #self.decode_token(token) will receive a token from client and decode it and if token is #successfully decoded, send back user details
    
    def self.decode_token(token)

        decode = JWT.decode(token, "build", true, {algorithm: "HS256"})

    end
end