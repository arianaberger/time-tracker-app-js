class User < ApplicationRecord
  has_many :entries
  has_many :projects, through: :entries
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true 
  validates :password, presence: true
  validates :password_confirmation, presence: true

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end
