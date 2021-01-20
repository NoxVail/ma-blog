class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :status, presence: true
  validates :user_id, uniqueness: {scope: :group_id}

  enum status: %i[inactive active banned]
end
