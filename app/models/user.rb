class User < ApplicationRecord
  validates :nick, presence: true, uniqueness: true
  # has_secure_password
end
