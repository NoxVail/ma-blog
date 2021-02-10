class BlogApi::V1::Entities::Posts < Grape::Entity
  expose :id
  expose :author_name do |post|
    user_id = post.user_id
    User.find(user_id).first_name
  end
  expose :published do |post|
    post.published_at.present?
  end
  expose :body, as: :description
  expose :title
end
