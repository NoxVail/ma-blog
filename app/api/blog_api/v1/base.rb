class BlogApi::V1::Base < Grape::API
  format :json
  prefix :v1

  mount BlogApi::V1::Posts
end
