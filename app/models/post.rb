class Post < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images

  validates :title, presence: true
  validates :body, presence: true

  scope :published, -> { where('published_at IS NOT NULL') }

  def publish
    update_attribute(:published_at, DateTime.now)
  end

  def unpublish
    update_attribute(:published_at, nil)
  end
end
