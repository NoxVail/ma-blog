module BlogApi::V1::Helpers::PostParams
  extend Grape::API::Helpers

  params :published do
    requires :user_id, type: Integer
  end

  params :shared do
    requires :post_id, type: Integer
    requires :user_id, type: Integer
  end

  params :create_post do
    requires :user_id, type: Integer
    requires :title, type: String
    requires :body, type: String
    optional :images_attributes, type: Array do
      requires :url, type: String
    end
  end

  params :update_post do
    requires :post_id, type: Integer
    requires :user_id, type: Integer
    optional :title, type: String
    optional :body, type: String
    end
end
