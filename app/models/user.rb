# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

validates :email, :password_digest, :session_token, presence: true
validates :email, :session_token, uniqueness: true

after_initialize :ensure_session_token

def self.find_by_credentials(email, password)
  user = self.find_by(email: email)
  return nil if user.nil?
  user.is_password?(password) ? user : nil
end

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
