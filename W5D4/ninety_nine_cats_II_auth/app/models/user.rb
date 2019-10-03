class User < ApplicationRecord
    attr_reader :password

    validates :username, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness: true 

    def self.find_by_credentials(username, password)
      user = User.find_by(username: username)

      if user.nil? || !user.is_password?(password)
        return nil
      else
        return user
      end
    end

    def reset_session_token!
      self.session_token = SecureRandom.urlsafe_base64
      self.save! 
      self.session_token 
    end

    def password=(password) 
      @password = password
      self.password_digest = BCrypt::Password.create(password)

    end

    def is_password?(password)
      bcrypt_password = BCrypt::Password.new(self.password_digest)
      bcrypt_password.is_password?(password)
    end
end