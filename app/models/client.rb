class Client < ApplicationRecord
  has_many :projects, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true

  def user_projects
    where(:user_id == current_user.id)
  end


end
