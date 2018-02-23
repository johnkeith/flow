module Authenticatable
  ALGORITHM = 'HS256'
  EXPIRATION = 30.minutes
  SECRET = Rails.application.secrets.auth_secret_key
  
  def self.decode(token)
    JWT.decode(token, SECRET, true, { algorithm: ALGORITHM })
  end

  def encode
    JWT.encode(payload, SECRET, ALGORITHM)
  end

  private

  def payload
    { user_id: id, user_type: user_type, exp: expiration }
  end

  def user_type 
    self.class.to_s.downcase
  end

  def expiration
    (Time.now + EXPIRATION).to_i
  end
end
