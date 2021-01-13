class User < ApplicationRecord
  has_many :posts
  has_many :images, as: :imageable

  validates :username, :password, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 8 }

  scope :adults, -> { where('birthday <= ?', 18.years.ago) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
