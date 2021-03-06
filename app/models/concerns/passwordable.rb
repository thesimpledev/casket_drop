require "bcrypt"

module Passwordable
  include BCrypt

  def authenticate(password)
    unhashed_password == password
  end

  private

  def hash_password
    self.password = Password.create(password) unless password_already_hashed?
  end

  def unhashed_password
    Password.new(password)
  end

  def password_already_hashed?
    Password.valid_hash?(password)
  end
end
