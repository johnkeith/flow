module Auth
  ALGORITHM = 'HS256'
  
  def encode
    JWT.encode(payload, secret, ALGORITHM)
  end
  
  def decode(token)
    JWT.decode(token, secret, true, { algorithm: ALGORITHM })
  end

  private

  def payload
    { user_id: id, user_type: self.class.to_s.downcase }
  end

  def secret
    Rails.application.secrets.auth_secret_key
  end
end
