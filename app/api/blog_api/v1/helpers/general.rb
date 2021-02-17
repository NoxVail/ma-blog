module BlogApi::V1::Helpers::General
  extend Grape::API::Helpers
  def declared_params
    declared(params, include_missing: false)
  end

  def image
    user = User.find(declared_params[:user_id])
    user.posts.create({ title:declared_params[:title], body:declared_params[:body], images_attributes: [url: declared_params[:image_url]] })
  end

  def no_image
    user = User.find(declared_params[:user_id])
    user.posts.create({ title:declared_params[:title], body:declared_params[:body] })
  end
end
