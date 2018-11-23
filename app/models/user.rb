class User < ApplicationRecord
  has_many :entries
  has_many :projects, through: :entries
  has_secure_password
  has_one_attached :image

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true 
  validates :password, presence: true
  validates :password_confirmation, presence: true

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  # validate :image_validated?

 #  def image_validated?
	# if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
	#   errors.add(:image, 'must be a JPEG or PNG format.')
	# elsif image.attached? == false
	#   errors.add(:image, 'must be included')
	# end
 #  end



end
