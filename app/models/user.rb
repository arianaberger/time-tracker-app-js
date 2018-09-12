class User < ApplicationRecord
  has_many :projects
  has_many :clients, through: :projects
  has_secure_password
  
end
