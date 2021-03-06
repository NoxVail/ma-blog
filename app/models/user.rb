class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :posts, dependent: :destroy
  has_many :images, as: :imageable
  has_many :memberships
  has_many :groups, through: :memberships

  validates :personal_data, :password, :email, presence: true
  validates :personal_data, :email, uniqueness: true
  validates :password, length: { minimum: 8 }

  scope :adults, -> { where('birthday <= ?', 18.years.ago) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
