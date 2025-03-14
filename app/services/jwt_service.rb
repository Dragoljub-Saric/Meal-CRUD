class JwtService
    HMAC_SECRET = Rails.application.secret_key_base # Use Rails' built-in secret key
  
    def self.encode(payload)
      # Encode a payload into a JWT token
      JWT.encode(payload, HMAC_SECRET)
    end
  
    def self.decode(token)
      # Decode a JWT token
      body = JWT.decode(token, HMAC_SECRET)[0]
      HashWithIndifferentAccess.new(body)
    rescue JWT::DecodeError
      nil
    end
  end