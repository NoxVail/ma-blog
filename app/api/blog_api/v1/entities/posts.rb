class BlogApi::V1::Entities::Posts < Grape::Entity
  expose :id
  expose :author_name do |post|
    post.user.first_name
  end
  expose :published do |post|
    post.published_at.present?
  end
  expose :body, as: :description
  expose :title
  expose :images, using: BlogApi::V1::Entities::Images do |post|
    post.images
  end
end
