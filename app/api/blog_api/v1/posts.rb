class BlogApi::V1::Posts < Grape::API
  helpers do
    def declared_params
      declared(params, include_missing: false)
    end
  end

  namespace ':user_id/posts' do
    params do
      requires :id
      requires :user_id
      optional :title, type: String
      optional :body, type: String
    end

    get ':id' do
      post = User.find(params[:user_id]).posts.published
      present post, with: BlogApi::V1::Entities::Posts
    end

    post do
      params do
        requires :user_id
        requires :title, type: String
        requires :body, type: String
      end
      user = User.find(params[:user_id])
      user.posts.create({ title:params[:title], body:params[:body]})
    end

    post ':id/publish' do
      User.find(params[:user_id]).posts.find(params[:id]).publish
    end

    post ':id/unpublish' do
      User.find(params[:user_id]).posts.find(params[:id]).unpublish
    end

    patch ':id' do
      post = User.find(params[:user_id]).posts.find(params[:id])
      post.update(declared_params)
    end

    delete ':id' do
      User.find(params[:user_id]).posts.find(params[:id]).destroy
    end
  end
end
