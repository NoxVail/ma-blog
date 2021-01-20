class Group < ApplicationRecord
  has_one :image, as: :imageable
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  validates :name, :group_type, :status, presence: true
  validates :name, uniqueness: true

  enum status: %i[active archived removed permanently_removed]
end
