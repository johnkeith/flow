def authenticate(user)
  token = user.encode
  token_string = "Bearer #{token}"
  request.headers["HTTP_AUTHORIZATION"] = token_string
end