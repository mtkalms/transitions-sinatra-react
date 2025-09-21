# frozen_string_literal: true

require 'sinatra/base'

module AuthenticationHelper
  def current_user
    User.find(session[:user_id]) if authenticated?
  end

  def authenticated?
    !session[:user_id].nil?
  end

  def authenticate!
    return if authenticated?

    session[:original_request] = request.path_info
    redirect '/login'
  end

  def login!(email, password)
    user = User.find_by(email: email)
    raise 'Invalid credentials' unless user&.authenticate(password)

    session[:user_id] = user.id unless user.nil?
    user
  end

  def logout!
    session.clear
  end
end
