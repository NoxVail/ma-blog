class BlogApi::V1::Posts < Grape::API
  helpers BlogApi::V1::Helpers::General, BlogApi::V1::Helpers::PostParams

  namespace :posts do
    desc 'Published posts.'
    params { use :published }
    get ':user_id' do
      posts = User.find(declared_params[:user_id]).posts.published
      present posts, with: BlogApi::V1::Entities::Posts
    end

    desc 'User specific post.'
    params { use :shared }
    get ':user_id/:post_id' do
      post = User.find(declared_params[:user_id]).posts.find(declared_params[:post_id])
      present post, with: BlogApi::V1::Entities::Posts
    end

    desc 'Create post.'
    params { use :create_post }
    post ':user_id' do
      user = User.find(declared_params[:user_id])
      user.posts.create(declared_params.except(:user_id))
    end

    desc 'Publish post.'
    params { use :shared }
    post ':user_id/:post_id/publish' do
      User.find(declared_params[:user_id]).posts.find(declared_params[:post_id]).publish
    end

    desc 'Unpublish post.'
    params { use :shared }
    post ':user_id/:post_id/unpublish' do
      User.find(declared_params[:user_id]).posts.find(declared_params[:post_id]).unpublish
    end

    desc 'Update post.'
    params { use :update_post }
    patch ':user_id/:post_id' do
      post = User.find(declared_params[:user_id]).posts.find(declared_params[:post_id])
      post.update(declared_params.except(:post_id, :user_id))
    end

    desc 'Delete post.'
    params { use :shared }
    delete ':user_id/:post_id' do
      User.find(declared_params[:user_id]).posts.find(declared_params[:post_id]).destroy
    end
  end
end
