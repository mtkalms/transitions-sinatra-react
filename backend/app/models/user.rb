# frozen_string_literal: true

require 'bcrypt'

# User model with secure password
class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
