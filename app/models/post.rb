class Post < ApplicationRecord
  has_many :images, as: :imageable

  scope :published, -> { where('published_at IS NOT NULL') }
end
