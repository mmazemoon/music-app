class User < ActiveRecord::Base

validates :email, :password_digest, :session_token, presence: true
validates :email, :session_token, uniqueness: true

def self.generate_session_token
  SecureRandom::base64(16)
end

def reset_session_token!
  self.session_token = self.class.generate_session_token
  self.save!
  session_token
end

def ensure_session_token
  self.session_token ||= self.reset_session_token!
end

# will be saved in controller
def password=(password)
  self.password_digest= BCrypt::Password.create(password)
end

def is_password?(password)
   BCrypt::Password.new(self.password_digest).is_password?
end

end
