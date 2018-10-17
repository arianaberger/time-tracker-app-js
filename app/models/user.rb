class User < ApplicationRecord
  has_many :projects, through: :clients
  has_many :clients
  has_many :entries, through: :projects
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true


end
