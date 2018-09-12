class User < ApplicationRecord
  has_many :projects
  has_many :clients, through: :projects
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true


end
