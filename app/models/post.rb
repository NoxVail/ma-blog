class Post < ApplicationRecord
  has_many :images, as: :imageable

  scope :published, -> { where('published_at IS NOT NULL') }

  def publish
    update_attribute(:published_at, DateTime.now)
  end

  def unpublish
    update_attribute(:published_at, nil)
  end
end
